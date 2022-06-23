import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/budget.viewmodel.dart';

final budgetProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  return BudgetViewModel(httpService, authViewModel);
});
