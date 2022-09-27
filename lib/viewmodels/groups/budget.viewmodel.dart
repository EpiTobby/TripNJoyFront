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
  AsyncValue<List<MoneyDueResponse>> owedMoney = const AsyncValue.loading();
  AsyncValue<List<MoneyDueResponse>> dueMoney = const AsyncValue.loading();

  Future<void> refreshGroupBudget(int groupId) async {
    await getGroupExpenses(groupId);
    await getBudgetBalance(groupId);
  }

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
        ? AsyncValue.data(newExpenses.reversed.toList())
        : AsyncValue.error(Exception("Failed to get group expenses"));
    notifyListeners();
  }

  Future<void> getUserOwedMoney(int groupId, num? userId) async {
    logger.d("Getting user $userId owed money");
    owedMoney = const AsyncValue.loading();
    notifyListeners();
    final newOwedMoney = await httpService.getUserOwedMoney(groupId, userId);
    owedMoney = newOwedMoney != null
        ? AsyncValue.data(newOwedMoney)
        : AsyncValue.error(Exception("Failed to get user owed Money"));
    notifyListeners();
  }

  Future<void> getUserDueMoney(int groupId, num? userId) async {
    logger.d("Getting user $userId owed money");
    dueMoney = const AsyncValue.loading();
    notifyListeners();
    final newDueMoney = await httpService.getUserDueMoney(groupId, userId);
    dueMoney = newDueMoney != null
        ? AsyncValue.data(newDueMoney)
        : AsyncValue.error(Exception("Failed to get user due Money"));
    notifyListeners();
  }

  Future<void> getUserReimbursement(int groupId, num? userId) async {
    logger.d("Getting User $userId Reimbursement");
    getUserOwedMoney(groupId, userId);
    getUserDueMoney(groupId, userId);
  }

  Future<void> addExpense(int groupId, num? userId, ExpenseRequest body) async {
    await httpService.createExpense(groupId, userId, body);
    refreshGroupBudget(groupId);
  }

  Future<void> updateExpense(int groupId, num? userId, num? expenseId, ExpenseRequest body) async {
    await httpService.updateExpense(groupId, userId, expenseId, body);
    refreshGroupBudget(groupId);
  }

  Future<void> deleteExpense(int groupId, num? expenseId) async {
    await httpService.deleteExpense(groupId, expenseId);
    refreshGroupBudget(groupId);
  }

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

  Future<ScanResponse?> scanReceipt(String minioUrl) async {
    final result = await httpService.scanReceipt(minioUrl);

    return result;
  }
}
