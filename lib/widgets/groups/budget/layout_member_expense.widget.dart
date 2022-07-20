import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';

class LayoutMemberExpense extends HookConsumerWidget {
  const LayoutMemberExpense({
    Key? key,
    required this.expense,
    required this.onWeightChange,
    required this.onAmountChange,
    required this.onToggleSelection,
  }) : super(key: key);

  final MemberExpense expense;
  final Function(String) onWeightChange;
  final Function(String) onAmountChange;
  final Function(bool?) onToggleSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightController = useTextEditingController(text: expense.weight?.toString());
    final amountController = useTextEditingController(text: expense.amount?.toString() ?? "0.0");

    useEffect(() {
      weightController.text = expense.weight?.toString() ?? "";
      return null;
    }, [expense.weight]);

    useEffect(() {
      amountController.text = expense.amount?.toStringAsFixed(2) ?? "0.0";
      return null;
    }, [expense.amount]);

    final decorator = InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.transparent,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.transparent,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.transparent,
        ),
      ),
    );

    return Row(
      children: [
        Checkbox(
            value: expense.selected,
            onChanged: onToggleSelection,
            activeColor: Theme.of(context).colorScheme.secondary),
        Expanded(
          child: Text(
            "${expense.member.firstname} ${expense.member.lastname}",
            style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        SizedBox(
          width: 32,
          child: TextField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            decoration: decorator,
            controller: weightController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (value) => onWeightChange(value),
            enabled: expense.selected,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: 80,
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              decoration: decorator,
              controller: amountController,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => onAmountChange(value),
              enabled: expense.selected,
            ),
          ),
        )
      ],
    );
  }
}
