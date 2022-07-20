import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/group/article.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_price.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/budget_receipt_article.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/layout_member_expense.widget.dart';

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
    final name = useTextEditingController(text: AppLocalizations.of(context).translate("groups.budget.expenses.title"));
    final paidBy = useState(group.members?.first);
    final paidFor = useState(group.members?.map((e) => MemberExpense(member: e, weight: 1)).toList());

    List<Article> getArticles(ScanResponse? scanReceipt) {
      var idx = 0;
      var articles = <Article>[];
      scanReceipt?.items?.forEach((key, item) {
        idx++;
        return articles.add(Article(
          id: idx,
          name: key,
          price: item,
          participants: group.members!.map((e) => e.id!.toInt()).toList(),
        ));
      });
      return articles;
    }

    final articles = useState(getArticles(scanReceipt));
    var sumArticles = articles.value.fold(0.0, (double acc, article) => acc + article.price);
    final total = useState(scanReceipt!.total ?? sumArticles);
    final totalController = useTextEditingController(text: total.value.toStringAsFixed(2));

    useEffect(() {
      sumArticles = articles.value.fold(0.0, (acc, article) => acc + article.price);

      return null;
    }, [articles.value]);

    final payTotal = useState(true);

    void balanceExpenses() {
      paidFor.value = budgetViewModel.balanceExpenses(total.value, paidFor.value);
    }

    balanceExpenses();

    bool isExpenseTotalValid() {
      final foldAmount =
          paidFor.value!.fold(0.0, (double previousValue, element) => previousValue + (element.amount ?? 0));

      return paidBy.value != null &&
          paidFor.value != null &&
          paidFor.value!.every((element) => element.amount == null || element.amount! > 0) &&
          foldAmount == total.value;
    }

    bool isSumArticlesEqualsTotal() {
      return sumArticles.toStringAsFixed(2) == total.value.toStringAsFixed(2);
    }

    bool isExpensePerArticleValid() {
      return articles.value.every((article) => article.participants.isNotEmpty) && isSumArticlesEqualsTotal();
    }

    void onEditArticle(article) {
      final idx = articles.value.indexWhere((e) => e.id == article.id);
      if (idx != -1) {
        articles.value[idx] = article;
        articles.value = [...articles.value];
      }
    }

    void onDeleteArticle(article) {
      articles.value = articles.value.where((e) => e.id != article.id).toList();
    }

    int getUnusedArticleId() {
      int idx = articles.value.length;
      while (articles.value.any((e) => e.id == idx)) {
        idx++;
      }
      return idx;
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(AppLocalizations.of(context).translate("groups.scan.total"),
                            style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.surface,
                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              controller: totalController,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              onChanged: (value) => {total.value = double.tryParse(value) ?? 0.0},
                            ),
                          ),
                        ),
                        Text(' €', style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary)),
                      ],
                    ),
                    if (!payTotal.value && !isSumArticlesEqualsTotal())
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            '${AppLocalizations.of(context).translate('groups.scan.missing')} ${((total.value - sumArticles)).toStringAsFixed(2)}€',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.error)),
                      ),
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
              cardVariant: !isSumArticlesEqualsTotal(),
              actionIcon: !isSumArticlesEqualsTotal() ? Icons.add : null,
              onAction: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return InputDialogPrice(
                      label: AppLocalizations.of(context).translate("groups.scan.addArticle.title"),
                      onConfirm: (name, price) {
                        articles.value = [
                          ...articles.value,
                          Article(
                            id: getUnusedArticleId(),
                            name: name,
                            price: price,
                            participants: group.members!.map((e) => e.id!.toInt()).toList(),
                          )
                        ];
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: articles.value
                      .map((article) => BudgetReceiptArticle(
                          groupId: groupId, article: article, onEdit: onEditArticle, onDelete: onDeleteArticle))
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
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: LayoutMemberExpense(
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
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ),
            ),
          ),
        const Padding(padding: EdgeInsets.only(top: 8.0)),
        if (name.text.isNotEmpty &&
            ((payTotal.value && isExpenseTotalValid()) || (!payTotal.value && isExpensePerArticleValid())))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              text: AppLocalizations.of(context).translate('common.submit'),
              onPressed: () async {
                Map<String, dynamic> json = {
                  'description': name.text,
                  'icon': icon.value.codePoint.toString(),
                  'total': total.value,
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
                    for (var article in articles.value) {
                      if (article.participants.contains(e.id!.toInt())) {
                        amountToPay += article.price / article.participants.length;
                      }
                    }
                    amountToPay = amountToPay * 100 / 100;
                    return MoneyDueRequest(userId: e.id, money: amountToPay).toJson();
                  }).toList();
                }
                await budgetViewModel.addExpense(groupId, paidBy.value!.id, ExpenseRequest.fromJson(json));
                Navigator.of(context).pop();
              },
            ),
          ),
      ],
    );
  }
}
