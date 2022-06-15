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
  }) : super(key: key);

  final MemberExpense expense;
  final Function(String) onWeightChange;
  final Function(String) onAmountChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightController = useTextEditingController(text: expense.weight?.toString());
    final amountController = useTextEditingController(text: expense.amount?.toString() ?? "0.00");

    useEffect(() {
      weightController.text = expense.weight?.toString() ?? "";
      return null;
    }, [expense.weight]);

    useEffect(() {
      amountController.text = expense.amount?.toString() ?? "0.00";
      return null;
    }, [expense.amount]);
    return Row(
      children: [
        Expanded(
          child: Text(
            "${expense.member.firstname} ${expense.member.lastname}",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        SizedBox(
          width: 32,
          child: TextField(
            controller: weightController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (value) => onWeightChange(value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: 80,
            child: TextField(
              controller: amountController,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => onAmountChange(value),
            ),
          ),
        )
      ],
    );
  }
}
