import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class MemberExpense {
  MemberExpense({
    required this.memberId,
    this.weight,
    this.amount,
    this.selected = true,
  });

  int memberId;
  int? weight;
  double? amount;
  bool selected;
}
