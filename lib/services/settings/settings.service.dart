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

  Future<String> updateFirstname(String id, String firstname) async {
    try {
      var response = await httpService.request(
          url: '/users/$id',
          method: Method.PATCH,
          params: {'firstname': firstname});
      return response['firstname'];
    } catch (e) {
      return Future.error(e);
    } finally {
      notifyListeners();
    }
  }
}
