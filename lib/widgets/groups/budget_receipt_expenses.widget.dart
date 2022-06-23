import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/group_scan_receipt.screen.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';
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

    final icon = useState(Icons.add_shopping_cart);
    final name = useState("");
    final paidBy = useState(group.members?.first);
    final paidFor = useState(group.members?.map((e) => MemberExpense(member: e, weight: 1)));

    final articles = scanReceipt!.items;
    final total =
        scanReceipt!.total != 0 ? scanReceipt!.total : articles!.values.reduce((acc, article) => acc + article);

    final payTotal = useState(true);

    final articlesParticipants = useState<Map<String, int>>({});

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
            Text('Total: $total€', style: const TextStyle(fontSize: 24)),
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
                  children: articles!.keys
                      .map((key) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '$key: ${articles[key]}€',
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
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
                                                isSelected: articlesParticipants.value[key] == e.id!.toInt(),
                                                onTap: (value) {
                                                  articlesParticipants.value = articlesParticipants.value.map(
                                                      (k, value) =>
                                                          k != key ? MapEntry(k, value) : MapEntry(k, e.id!.toInt()));
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
                              },
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ),
            ),
          ),
        if (name.value.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: PrimaryButton(text: AppLocalizations.of(context).translate('common.submit'), onPressed: () {}),
          ),
      ],
    );
  }
}
