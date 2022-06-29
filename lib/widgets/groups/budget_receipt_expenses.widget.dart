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
import 'package:trip_n_joy_front/screens/groups/group_scan_receipt.screen.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_price.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/layout_member_expense.widget.dart';

class BudgetReceiptExpenses extends HookConsumerWidget {
  const BudgetReceiptExpenses({Key? key, required this.groupId, required this.scanReceipt}) : super(key: key);

  final int groupId;
  final ScanResponse? scanReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (scanReceipt == null) {
      return Container();
    }

    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final budgetViewModel = ref.watch(budgetProvider);

    final icon = useState(Icons.add_shopping_cart);
    final name = useTextEditingController(text: "");
    final paidBy = useState(group.members?.first);
    final paidFor = useState(group.members?.map((e) => MemberExpense(member: e, weight: 1)).toList());

    final articles = useState(scanReceipt!.items!);
    var sumArticles = articles.value.values.fold(0.0, (double acc, article) => acc + article);
    final total = scanReceipt!.total ?? sumArticles;

    useEffect(() {
      sumArticles = articles.value.values.fold(0.0, (acc, article) => acc + article);

      return null;
    }, [articles.value]);

    final payTotal = useState(true);

    final articlesParticipants = useState<Map<String, List<int>>>(
        articles.value.map((key, value) => MapEntry(key, group.members!.map((e) => e.id!.toInt()).toList())));

    void balanceExpenses() {
      paidFor.value = budgetViewModel.balanceExpenses(total, paidFor.value);
    }

    balanceExpenses();

    bool isExpenseTotalValid() {
      final foldAmount =
          paidFor.value!.fold(0.0, (double previousValue, element) => previousValue + (element.amount ?? 0));

      return paidBy.value != null &&
          paidFor.value != null &&
          paidFor.value!.every((element) => element.amount == null || element.amount! > 0) &&
          foldAmount == total;
    }

    bool isExpensePerArticleValid() {
      return articlesParticipants.value.values.every((members) => members.isNotEmpty) &&
          sumArticles.toStringAsFixed(2) == total.toStringAsFixed(2);
    }

    return ListView(
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
          controller: name,
          icon: const Icon(Icons.shop),
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
                              avatarUrl: MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Text('Total: $total€', style: const TextStyle(fontSize: 24)),
                if (!payTotal.value && sumArticles.toStringAsFixed(2) != total.toStringAsFixed(2))
                  Text(
                      '${AppLocalizations.of(context).translate('groups.scan.missing')} ${((total - sumArticles)).toStringAsFixed(2)}€',
                      style: const TextStyle(fontSize: 16, color: Colors.red)),
              ],
            ),
            PrimaryButton(
              text: payTotal.value
                  ? AppLocalizations.of(context).translate("groups.scan.perArticle")
                  : AppLocalizations.of(context).translate("groups.scan.perPerson"),
              onPressed: () {
                payTotal.value = !payTotal.value;
              },
              fitContent: true,
            )
          ]),
        ),
        if (!payTotal.value)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LayoutItem(
              title: 'Articles',
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: articles.value.keys
                      .map((key) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '$key: ${articles.value[key]}€',
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                    SecondaryButton(
                                      text: AppLocalizations.of(context).translate("groups.scan.adjust"),
                                      onPressed: () {
                                        showBarModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AnimatedPadding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                                ),
                                                curve: Curves.easeOut,
                                                duration: const Duration(milliseconds: 200),
                                                child: Material(
                                                  child: SafeArea(
                                                    top: false,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 16.0),
                                                            child: Text(
                                                              '$key: ${articles.value[key]}€',
                                                              style: const TextStyle(fontSize: 24),
                                                              textAlign: TextAlign.start,
                                                            ),
                                                          ),
                                                          Wrap(
                                                            alignment: WrapAlignment.center,
                                                            children: [
                                                              SecondaryButton(
                                                                text: AppLocalizations.of(context)
                                                                    .translate("groups.scan.changePrice"),
                                                                onPressed: () {
                                                                  showBarModalBottomSheet(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return InputDialogPrice(
                                                                            label: AppLocalizations.of(context)
                                                                                .translate(
                                                                                    "groups.scan.addArticle.title"),
                                                                            shouldHaveInputName: false,
                                                                            onConfirm: (name, price) {
                                                                              articles.value[key] = price;
                                                                              articles.value = {...articles.value};
                                                                              Navigator.of(context).pop();
                                                                            });
                                                                      });
                                                                },
                                                                fitContent: true,
                                                              ),
                                                              PrimaryButton(
                                                                text: AppLocalizations.of(context)
                                                                    .translate('common.delete'),
                                                                onPressed: () {
                                                                  articles.value.remove(key);
                                                                  articles.value = {...articles.value};
                                                                  articlesParticipants.value.remove(key);
                                                                  Navigator.of(context).pop();
                                                                },
                                                                fitContent: true,
                                                                color: Theme.of(context).errorColor,
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      fitContent: true,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  height: 100,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: group.members
                                            ?.map(
                                              (e) => LayoutRowItemMember(
                                                name: "${e.firstname} ${e.lastname}",
                                                avatarUrl:
                                                    MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR),
                                                isSelected: articlesParticipants.value[key]!.contains(e.id!.toInt()),
                                                onTap: (value) {
                                                  articlesParticipants.value = articlesParticipants.value.map(
                                                      (k, val) => k != key
                                                          ? MapEntry(k, val)
                                                          : (value
                                                              ? MapEntry(k, [...val, e.id!.toInt()])
                                                              : MapEntry(
                                                                  k, val.where((m) => m != e.id!.toInt()).toList())));
                                                },
                                              ),
                                            )
                                            .toList() ??
                                        [],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        if (payTotal.value)
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
        if (!payTotal.value && sumArticles.toStringAsFixed(2) != total.toStringAsFixed(2))
          PrimaryButton(
              text: AppLocalizations.of(context).translate('groups.scan.addArticle.title'),
              onPressed: () {
                showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialogPrice(
                          label: AppLocalizations.of(context).translate("groups.scan.addArticle.title"),
                          onConfirm: (name, price) {
                            articles.value = {...articles.value, name: price};
                            articlesParticipants.value[name] = group.members!.map((e) => e.id!.toInt()).toList();
                          });
                    });
              }),
        if (name.text.isNotEmpty &&
            ((payTotal.value && isExpenseTotalValid()) || (!payTotal.value && isExpensePerArticleValid())))
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: PrimaryButton(
                text: AppLocalizations.of(context).translate('common.submit'),
                onPressed: () async {
                  Map<String, dynamic> json = {
                    'description': name.text,
                    'icon': icon.value.codePoint.toString(),
                    'total': total,
                  };

                  if (payTotal.value) {
                    json['moneyDueByEachUser'] = paidFor.value!
                        .where((element) => element.selected)
                        .map((element) => MoneyDueRequest(userId: element.member.id, money: element.amount).toJson())
                        .toList();

                    json['evenlyDivided'] = paidFor.value!.every((element) => element.weight == 1);
                  } else {
                    json['moneyDueByEachUser'] = group.members!.map((e) {
                      var amountToPay = 0.0;
                      articlesParticipants.value.forEach((key, value) {
                        if (value.contains(e.id!.toInt())) {
                          amountToPay += articles.value[key] / value.length;
                        }
                      });

                      return MoneyDueRequest(userId: e.id, money: amountToPay).toJson();
                    }).toList();
                  }
                  await budgetViewModel.addExpense(groupId, paidBy.value!.id, ExpenseRequest.fromJson(json));
                  Navigator.of(context).pop();
                }),
          ),
      ],
    );
  }
}
