import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/screens/groups/edit_expense.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/budget_balances.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_expenses.widget.dart';

class GroupBudget extends HookConsumerWidget {
  const GroupBudget({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetViewModel = ref.watch(budgetProvider);

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
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Container(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          width: double.infinity,
          child: ListView(
            children: [
              BudgetBalances(groupId: groupId),
              GroupExpenses(groupId: groupId),
            ],
          ),
        ),
      ),
    );
  }
}
