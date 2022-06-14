import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class BudgetViewModel extends ChangeNotifier {
  BudgetViewModel(this.httpService, this.authViewModel);

  final HttpService httpService;
  final AuthViewModel authViewModel;

  AsyncValue<List<BalanceResponse>> budgets = const AsyncValue.loading();
  void getBudgetBalance(int groupId) async {
    logger.d("Getting Budget Balance for group $groupId");
    budgets = const AsyncValue.loading();
    notifyListeners();
    final newBudgets = await httpService.getBudgetBalance(groupId);
    budgets = newBudgets != null
        ? AsyncValue.data(newBudgets)
        : AsyncValue.error(Exception("Failed to get group budget balance"));
    notifyListeners();
  }

  void getGroupExpenses(int groupId) async {
    logger.d("Getting Group Expenses for group $groupId");
  }
}
