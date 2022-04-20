import 'package:flutter/cupertino.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class GroupViewModel extends ChangeNotifier {
  GroupViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  void _init() {}

  void joinGroup(String groupId) async {
    notifyListeners();
  }
}