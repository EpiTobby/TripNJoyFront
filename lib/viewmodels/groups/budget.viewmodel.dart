import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class BudgetViewModel extends ChangeNotifier {
  BudgetViewModel(this.httpService, this.authViewModel);

  final HttpService httpService;
  final AuthViewModel authViewModel;
}
