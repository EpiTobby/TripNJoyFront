import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/member_expense.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class BudgetViewModel extends ChangeNotifier {
  BudgetViewModel(this.httpService, this.authViewModel);

  final HttpService httpService;
  final AuthViewModel authViewModel;

  AsyncValue<List<BalanceResponse>> balances = const AsyncValue.loading();
  AsyncValue<List<ExpenseModel>> expenses = const AsyncValue.loading();

  Future<void> getBudgetBalance(int groupId) async {
    logger.d("Getting Budget Balance for group $groupId");
    balances = const AsyncValue.loading();
    notifyListeners();
    final newBudgets = await httpService.getBudgetBalance(groupId);
    balances = newBudgets != null
        ? AsyncValue.data(newBudgets)
        : AsyncValue.error(Exception("Failed to get group budget balance"));
    notifyListeners();
  }

  Future<void> getGroupExpenses(int groupId) async {
    logger.d("Getting Group Expenses for group $groupId");
    expenses = const AsyncValue.loading();
    notifyListeners();
    final newExpenses = await httpService.getExpenses(groupId);
    expenses = newExpenses != null
        ? AsyncValue.data(newExpenses)
        : AsyncValue.error(Exception("Failed to get group expenses"));
    notifyListeners();
  }

  Future<void> addExpense(int groupId, num? userId, ExpenseRequest body) async {
    await httpService.createExpense(groupId, userId, body);
  }

  Future<void> updateExpense(int groupId, num? userId, ExpenseRequest body) async {}

  List<MemberExpense> balanceExpenses(double amount, List<MemberExpense>? memberExpenses) {
    if (memberExpenses == null) {
      return [];
    }
    final memberExpensesFiltered = memberExpenses.where((element) => element.selected);
    final weightedMembers = memberExpensesFiltered.where((element) => element.weight != null);
    final amountMembers = memberExpensesFiltered.where((element) => element.amount != null && element.weight == null);

    for (var element in amountMembers) {
      amount -= element.amount!;
    }

    if (weightedMembers.isEmpty) {
      return memberExpenses;
    }

    final totalWeight = weightedMembers.fold(0, (int value, element) => value + element.weight!);
    final amountPerWeight = amount / totalWeight;

    for (var memberExpense in memberExpenses) {
      if (memberExpense.weight != null && memberExpense.selected) {
        memberExpense.amount = memberExpense.weight! * amountPerWeight;
      }
    }

    return memberExpenses;
  }
}
