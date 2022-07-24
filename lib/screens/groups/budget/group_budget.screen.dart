import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/budget/budget_reimbursement.screen.dart';
import 'package:trip_n_joy_front/screens/groups/budget/group_scan_receipt.screen.dart';
import 'package:trip_n_joy_front/screens/groups/budget/edit_expense.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/budget_balances.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/group_expenses.widget.dart';

class GroupBudget extends HookConsumerWidget {
  const GroupBudget({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref.watch(groupProvider.notifier).groups.firstWhere((group) => group.id == groupId);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            AppLocalizations.of(context).translate('groups.budget.title'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.currency_exchange, color: Theme.of(context).colorScheme.onBackground),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => BudgetReimbursement(groupId: groupId)));
            },
            splashRadius: 16,
          ),
          if (group.state != GroupModelState.archived)
            IconButton(
                icon: Icon(Icons.camera_alt, color: Theme.of(context).colorScheme.onBackground),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => GroupScanReceipt(groupId: groupId)));
                },
                splashRadius: 16),
          if (group.state != GroupModelState.archived)
            IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditExpense(groupId: groupId)));
              },
              splashRadius: 16,
            ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(budgetProvider).getGroupExpenses(groupId);
        },
        color: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Container(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
            width: double.infinity,
            child: ListView(
              children: [
                BudgetBalances(groupId: groupId),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GroupExpenses(groupId: groupId),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
