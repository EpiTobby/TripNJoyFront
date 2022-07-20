import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/screens/groups/budget/edit_expense.screen.dart';

class BudgetExpense extends StatelessWidget {
  const BudgetExpense({
    Key? key,
    required this.groupId,
    required this.expense,
  }) : super(key: key);

  final int groupId;
  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    final iconData = IconData(int.parse(expense.icon!), fontFamily: 'MaterialIcons');
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditExpense(groupId: groupId, expense: expense)));
      },
      child: Row(
        children: [
          if (expense.icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(iconData, size: 48.0, color: Theme.of(context).colorScheme.primary),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.description ?? "",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                Text(
                    AppLocalizations.of(context).translate("groups.budget.expenses.paid_by",
                        {"name": "${expense.purchaser?.firstname} ${expense.purchaser?.lastname}"}),
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                Text(
                    AppLocalizations.of(context).translate("groups.budget.expenses.paid_for", {
                      "members": expense.indebtedUsers
                              ?.map((u) => "${u.userModel?.firstname} ${u.userModel?.lastname}")
                              .join(", ") ??
                          ""
                    }),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
          Text(
            "${(expense.total ?? 0).toStringAsFixed(2)}€",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
