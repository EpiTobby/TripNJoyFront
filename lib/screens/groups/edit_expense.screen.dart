import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/layout_member_expense.widget.dart';

class EditExpense extends HookConsumerWidget {
  const EditExpense({Key? key, required this.groupId, this.expense}) : super(key: key);

  final int groupId;
  final ExpenseModel? expense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);
    final budgetViewModel = ref.watch(budgetProvider);
    final icon = useState(Icons.add_shopping_cart);
    final name = useState("");
    final price = useState(0.0);
    final paidBy = useState(group.members?.first);
    final paidFor = useState(group.members?.map((e) => MemberExpense(member: e, weight: 1)).toList());

    void balanceExpenses() {
      paidFor.value = budgetViewModel.balanceExpenses(price.value, paidFor.value);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)
              .translate(expense != null ? 'groups.budget.edit.title' : 'groups.budget.add.title')),
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          actions: [
            IconButton(
              splashRadius: 16,
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutRowItem(
                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.icon.title"),
                child: Icon(
                  icon.value,
                  size: 48,
                ),
                onTap: () async {
                  IconData? newIcon = await FlutterIconPicker.showIconPicker(context);
                  if (newIcon != null) {
                    icon.value = newIcon;
                  }
                },
              ),
            ),
            InputField(
              label: AppLocalizations.of(context).translate("groups.budget.edit.name"),
              onChanged: (value) => name.value = value,
              icon: const Icon(Icons.shop),
            ),
            InputField(
              label: AppLocalizations.of(context).translate("groups.budget.edit.price"),
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
                title: AppLocalizations.of(context).translate("groups.budget.edit.paid_by"),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: group.members
                              ?.map(
                                (e) => LayoutRowItemMember(
                                  name: "${e.firstname} ${e.lastname}",
                                  avatarUrl: MinioService.getImageUrl(e.profilePicture),
                                  isSelected: paidBy.value == e,
                                  onTap: (value) {
                                    paidBy.value = e;
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
                title: AppLocalizations.of(context).translate("groups.budget.edit.paid_for"),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: paidFor.value
                            ?.map(
                              (e) => LayoutMemberExpense(
                                expense: e,
                                onWeightChange: (value) {
                                  paidFor.value = paidFor.value?.map(
                                    (member) {
                                      if (member.member == e.member) {
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
                                      if (member.member == e.member) {
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
                                      if (member.member == e.member) {
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
                            )
                            .toList() ??
                        [],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
