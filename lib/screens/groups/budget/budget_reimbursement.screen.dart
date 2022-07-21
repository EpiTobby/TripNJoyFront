import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/money_due.widget.dart';

class BudgetReimbursement extends HookConsumerWidget {
  const BudgetReimbursement({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.read(userProvider);
    final userId = userViewModel.value?.id;
    final username = "${userViewModel.value?.firstname} ${userViewModel.value?.lastname}";
    final budgetViewModel = ref.watch(budgetProvider);
    final owedMoney = budgetViewModel.owedMoney;
    final dueMoney = budgetViewModel.dueMoney;

    useEffect(() {
      Future.microtask(() => budgetViewModel.getUserReimbursement(groupId, userId));
      return null;
    }, [userId]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.budget.reimbursement.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        shrinkWrap: true,
        children: [
          LayoutBox(
              title: AppLocalizations.of(context).translate("groups.budget.reimbursement.owed.title"),
              top: true,
              children: [
                AsyncValueWidget<List<MoneyDueResponse>>(
                  value: owedMoney,
                  data: (data) => Column(
                    children: data.isEmpty
                        ? [
                            LayoutEmpty(
                              message: AppLocalizations.of(context).translate("groups.budget.reimbursement.owed.empty"),
                              icon: Icons.highlight_remove,
                            ),
                          ]
                        : data
                            .map(
                              (e) => MoneyDue(
                                amount: e.total,
                                user: username,
                                other: "${e.user?.firstname} ${e.user?.lastname}",
                                owed: true,
                              ),
                            )
                            .toList(),
                  ),
                ),
              ]),
          LayoutBox(
            title: AppLocalizations.of(context).translate("groups.budget.reimbursement.due.title"),
            children: [
              AsyncValueWidget<List<MoneyDueResponse>>(
                value: dueMoney,
                data: (data) => Column(
                  children: data.isEmpty
                      ? [
                          LayoutEmpty(
                            message: AppLocalizations.of(context).translate("groups.budget.reimbursement.due.empty"),
                            icon: Icons.highlight_remove,
                          ),
                        ]
                      : data
                          .map(
                            (e) => MoneyDue(
                              amount: e.total,
                              user: username,
                              other: "${e.user?.firstname} ${e.user?.lastname}",
                              owed: false,
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
