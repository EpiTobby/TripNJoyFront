import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class MemberExpense {
  MemberExpense({
    required this.member,
    this.weight,
    this.amount,
  });

  MemberModel member;
  int? weight;
  double? amount;
}
