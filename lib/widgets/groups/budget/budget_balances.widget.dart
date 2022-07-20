import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/groups/budget.provider.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/budget_balance.widget.dart';

class BudgetBalances extends HookConsumerWidget {
  const BudgetBalances({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetViewModel = ref.watch(budgetProvider);
    final balances = budgetViewModel.balances;
    final expenses = budgetViewModel.expenses;

    useEffect(() {
      Future.microtask(() => ref.read(budgetProvider).getBudgetBalance(groupId));
      return null;
    }, []);
    return balances.when(
      data: (data) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map(
                (e) => BudgetBalance(
                  balance: e,
                  total: data.fold(
                    1,
                    (prev, next) {
                      final money = (next.money ?? 0).abs();
                      return money > prev ? money : prev;
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, r) {
        logger.e(error, r);
        return const ErrorScreen();
      },
    );
  }
}
