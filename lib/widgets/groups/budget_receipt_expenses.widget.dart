import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/layout_member_expense.widget.dart';

class BudgetReceiptExpenses extends HookConsumerWidget {
  const BudgetReceiptExpenses({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);
    final icon = useState(Icons.add_shopping_cart);
    final name = useState("");
    final paidBy = useState(group.members?.first);
    final paidFor = useState(group.members?.map((e) => MemberExpense(member: e, weight: 1)));

    final articles = useState<Map<String, int>>({
      'article1': 1,
      'article2': 2,
      'article3': 3,
      'article4': 4,
      'article5': 5,
      'article6': 6,
      'article7': 7,
      'article8': 8,
      'article9': 9,
      'article10': 10,
    });
    final total = useState(10);

    final payTotal = useState(true);

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
          onChanged: (value) => name.value = value,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total: ${total.value}€', style: TextStyle(fontSize: 24)),
            PrimaryButton(
              text: payTotal.value ? 'Par article' : 'Par personne',
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
              title: AppLocalizations.of(context).translate("groups.budget.edit.paid_for"),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: articles.value.keys
                      .map((key) => Column(
                            children: [
                              Text('$key: ${articles.value[key]}€', style: TextStyle(fontSize: 18),),
                              SizedBox(
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
                      onWeightChange: (value) => paidFor.value = paidFor.value?.map(
                            (member) {
                          if (member.member == e.member) {
                            member.weight = int.tryParse(value);
                            member.amount = null;
                          }
                          return member;
                        },
                      ),
                      onAmountChange: (value) => paidFor.value = paidFor.value?.map(
                            (member) {
                          if (member.member == e.member) {
                            member.amount = double.tryParse(value);
                            member.weight = null;
                          }
                          return member;
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
      ],
    );
  }
}
