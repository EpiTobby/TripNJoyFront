import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';

class BudgetBalance extends HookConsumerWidget {
  const BudgetBalance({
    Key? key,
    required this.balance,
    required this.total,
  }) : super(key: key);

  final BalanceResponse balance;
  final double total;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.watch(userProvider.notifier);

    final balanceUser = useState<UserResponse?>(null);

    useEffect(() {
      Future.microtask(() async {
        balanceUser.value = await userViewModel.getUserById(balance.user!.toInt());
      });
      return () {};
    }, [balance]);

    final username = "${balanceUser.value?.firstname} ${balanceUser.value?.lastname}";
    final money = balance.money ?? 0;
    final positiveMoney = money.isNegative ? -money : money;
    final widthPercent = min(max(positiveMoney / total, 0.1), 1);
    const screenPadding = 80;
    final widthByScreen = widthPercent * (MediaQuery.of(context).size.width - screenPadding);
    const threshold = 0.3;
    final exceedThreshold = widthPercent > threshold;

    if (balanceUser.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
          child: Text(
            username,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Row(
          children: [
            Container(
              height: 24,
              width: widthByScreen,
              decoration: BoxDecoration(
                color:
                    money.isNegative ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: exceedThreshold
                  ? Center(
                      child: Text(
                        money.toStringAsFixed(2),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  : null,
            ),
            if (!exceedThreshold)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      money.toStringAsFixed(2),
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
