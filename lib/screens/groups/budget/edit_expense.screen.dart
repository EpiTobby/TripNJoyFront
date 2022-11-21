import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/layout_member_expense.widget.dart';

class EditExpense extends HookConsumerWidget {
  const EditExpense({Key? key, required this.groupId, this.expense}) : super(key: key);

  final int groupId;
  final ExpenseModel? expense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final groupInfoModel = useState<GroupInfoModel?>(null);

    useEffect(() {
      Future.microtask(() async {
        groupInfoModel.value = await groupViewModel.getGroupPublicInfo(groupId);
      });

      return () {};
    }, [groupId]);

    final budgetViewModel = ref.watch(budgetProvider);
    final icon = useState(expense?.icon != null
        ? IconData(int.parse(expense!.icon!), fontFamily: 'MaterialIcons')
        : Icons.add_shopping_cart);
    final name =
        useState(expense?.description ?? AppLocalizations.of(context).translate("groups.budget.expenses.title"));
    final price = useState(expense?.total ?? 0.0);
    final paidBy =
        useState(expense != null ? group.members?.firstWhere((m) => m == expense?.purchaserId) : group.members?.first);
    final paidFor = useState(expense != null && expense!.indebtedUsers != null
        ? expense!.indebtedUsers!
                .map((e) => MemberExpense(
                    memberId: group.members!.firstWhere((m) => m == e.userId).toInt(), amount: e.amountToPay))
                .toList() +
            group.members!
                .where((m) => !expense!.indebtedUsers!.any((user) => user.userId == m))
                .map((e) => MemberExpense(memberId: e.toInt(), selected: false))
                .toList()
        : group.members
            ?.map((e) => MemberExpense(memberId: e.toInt(), weight: 1))
            .toList()); // TODO : add a sort with usernames
    final isLoading = useState(false);

    void balanceExpenses() {
      paidFor.value = budgetViewModel.balanceExpenses(price.value, paidFor.value);
    }

    bool isExpenseValid() {
      return name.value.isNotEmpty &&
          !price.value.isNegative &&
          price.value != 0.0 &&
          paidBy.value != null &&
          paidFor.value != null &&
          paidFor.value!.every((element) => element.amount == null || element.amount! > 0) &&
          paidFor.value!.fold(0.0, (double previousValue, element) => previousValue + (element.amount ?? 0)) ==
              price.value;
    }

    final nameController = useTextEditingController(text: name.value);
    final priceController = useTextEditingController(text: price.value.toString())
      ..addListener(() {
        balanceExpenses();
      });

    if (groupInfoModel.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)
            .translate(expense != null ? 'groups.budget.edit.title' : 'groups.budget.add.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          if (isExpenseValid())
            if (!isLoading.value)
              IconButton(
                splashRadius: 16,
                icon: const Icon(Icons.check),
                onPressed: () async {
                  isLoading.value = true;
                  Map<String, dynamic> json = {
                    'description': name.value,
                    'moneyDueByEachUser': paidFor.value!
                        .where((element) => element.selected)
                        .map((element) => MoneyDueRequest(userId: element.memberId, money: element.amount).toJson())
                        .toList(),
                    'icon': icon.value.codePoint.toString(),
                    'evenlyDivided': paidFor.value!.every((element) => element.weight == 1),
                    'total': price.value,
                  };
                  if (expense != null) {
                    await budgetViewModel.updateExpense(
                        groupId, paidBy.value!, expense!.id, ExpenseRequest.fromJson(json));
                  } else {
                    await budgetViewModel.addExpense(groupId, paidBy.value!, ExpenseRequest.fromJson(json));
                  }
                  isLoading.value = false;
                  Navigator.of(context).pop();
                },
              )
            else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.planning.activity.edit.icon.title"),
              boldTitle: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () async {
                    IconData? newIcon = await FlutterIconPicker.showIconPicker(
                      context,
                      iconColor: Theme.of(context).colorScheme.onBackground,
                      backgroundColor: Theme.of(context).colorScheme.background,
                    );
                    if (newIcon != null) {
                      icon.value = newIcon;
                    }
                  },
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: Icon(icon.value, size: 48, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
          InputField(
            label: AppLocalizations.of(context).translate("groups.budget.edit.name"),
            controller: nameController,
            onChanged: (value) => name.value = value,
            icon: const Icon(Icons.shop),
          ),
          InputField(
            label: AppLocalizations.of(context).translate("groups.budget.edit.price"),
            controller: priceController,
            onChanged: (value) {
              price.value = double.tryParse(value) ?? 0.0;
              balanceExpenses();
            },
            icon: const Icon(Icons.price_change),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.budget.edit.paid_by"),
              boldTitle: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: groupInfoModel.value!.members
                            ?.map(
                              (e) => LayoutRowItemMember(
                                name: "${e.firstname} ${e.lastname}",
                                avatarUrl: MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR),
                                isSelected: paidBy.value == e.userId,
                                onTap: (value) {
                                  paidBy.value = e.userId;
                                },
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.budget.edit.paid_for"),
              boldTitle: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: paidFor.value
                          ?.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: LayoutMemberExpense(
                                expense: e,
                                onWeightChange: (value) {
                                  paidFor.value = paidFor.value?.map(
                                    (member) {
                                      if (member.memberId == e.memberId) {
                                        member.weight = int.tryParse(value);
                                        member.amount = null;
                                      }
                                      return member;
                                    },
                                  ).toList();
                                  balanceExpenses();
                                },
                                onAmountChange: (value) {
                                  paidFor.value = paidFor.value?.map(
                                    (member) {
                                      if (member.memberId == e.memberId) {
                                        member.amount = double.tryParse(value);
                                        member.weight = null;
                                      }
                                      return member;
                                    },
                                  ).toList();
                                  balanceExpenses();
                                },
                                onToggleSelection: (value) {
                                  paidFor.value = paidFor.value?.map(
                                    (member) {
                                      if (member.memberId == e.memberId) {
                                        member.selected = value == true;
                                        member.amount = null;
                                        member.weight = value == true ? 1 : null;
                                      }
                                      return member;
                                    },
                                  ).toList();
                                  balanceExpenses();
                                },
                              ),
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ),
            ),
          ),
          if (expense != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: LayoutItem(
                cardVariant: true,
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.budget.edit.delete.title"),
                  icon: Icons.exit_to_app,
                  customColor: Theme.of(context).colorScheme.error,
                  onPressed: () {
                    showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialogChoice(
                          title: AppLocalizations.of(context).translate("groups.budget.edit.delete.confirm"),
                          cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                          confirmChoice: AppLocalizations.of(context).translate('common.delete'),
                          onConfirm: (value) async {
                            if (value) {
                              await budgetViewModel.deleteExpense(groupId, expense!.id);
                              Navigator.of(context).pop();
                            }
                          },
                          delete: true,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
