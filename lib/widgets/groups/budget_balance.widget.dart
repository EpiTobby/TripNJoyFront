import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class BudgetBalance extends StatelessWidget {
  const BudgetBalance({
    Key? key,
    required this.balance,
    required this.total,
  }) : super(key: key);

  final BalanceResponse balance;
  final double total;

  @override
  Widget build(BuildContext context) {
    final username = "${balance.user?.firstname} ${balance.user?.lastname}";
    final money = balance.money ?? 0;
    final positiveMoney = money.isNegative ? -money : money;
    final widthPercent = min(max(positiveMoney / total, 0.1), 1);
    const screenPadding = 80;
    final widthByScreen = widthPercent * (MediaQuery.of(context).size.width - screenPadding);
    const threshold = 0.3;
    final exceedThreshold = widthPercent > threshold;

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
                        money.toString(),
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
                      money.toString(),
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
