import 'package:flutter/cupertino.dart';

import '../../services/api/http.service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel(this.httpService) {
    httpService.init();
  }

  final HttpService httpService;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
