import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class MemberExpense {
  MemberExpense({
    required this.member,
    this.weight,
    this.amount,
    this.selected = true,
  });

  MemberModel member;
  int? weight;
  double? amount;
  bool selected;
}
