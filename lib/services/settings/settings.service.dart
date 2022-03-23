import 'package:flutter/cupertino.dart';

import '../api/http.service.dart';

class SettingsService extends ChangeNotifier {
  SettingsService(this.httpService) {
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
