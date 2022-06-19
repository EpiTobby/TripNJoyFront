import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class BudgetExpense extends StatelessWidget {
  const BudgetExpense({
    Key? key,
    required this.expense,
  }) : super(key: key);

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    final iconData = IconData(int.parse(expense.icon!), fontFamily: 'MaterialIcons');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (expense.icon != null) Icon(iconData, size: 16.0, color: Theme.of(context).colorScheme.primary),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.description ?? "", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              Text(
                  AppLocalizations.of(context).translate("groups.budget.expense.paid_by",
                      {"name": "${expense.purchaser?.firstname} ${expense.purchaser?.lastname}"}),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              Text(
                  AppLocalizations.of(context).translate("groups.budget.expense.paid_for", {
                    "members": expense.indebtedUsers
                            ?.map((u) => "${u.userModel?.firstname} ${u.userModel?.lastname}")
                            .join(", ") ??
                        ""
                  }),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            ],
          ),
          Text(
            "${expense.total ?? 0.toStringAsFixed(2)}€",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
