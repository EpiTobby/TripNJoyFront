import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_expense.widget.dart';

class GroupExpenses extends HookConsumerWidget {
  const GroupExpenses({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetViewModel = ref.watch(budgetProvider);
    final expenses = budgetViewModel.expenses;
    return Column(
      children: [
        LayoutBox(
          title: AppLocalizations.of(context).translate("groups.budget.expenses"),
          children: expenses.when(
            data: (data) => data.map((e) => BudgetExpense(expense: e)).toList(),
            loading: () => [const Center(child: CircularProgressIndicator())],
            error: (error, r) {
              logger.e(error, r);
              return [const ErrorScreen()];
            },
          ),
        )
      ],
    );
  }
}