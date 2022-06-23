import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class MoneyDue extends StatelessWidget {
  const MoneyDue({
    Key? key,
    required this.amount,
    required this.user,
    required this.other,
    required this.owed,
  }) : super(key: key);

  final double? amount;
  final String user;
  final String other;
  final bool owed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: owed
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
              : Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      owed ? other : "$user (me)",
                      style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        AppLocalizations.of(context).translate("groups.budget.reimbursement.owes"),
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Text(
                      owed ? "$user (me)" : other,
                      style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "${(amount ?? 0).toStringAsFixed(2)}€",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
