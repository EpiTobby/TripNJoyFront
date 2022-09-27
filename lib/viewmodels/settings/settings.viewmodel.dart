import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel(this.httpService, this.storage) {
    httpService.init();
    init();
  }

  final HttpService httpService;
  final FlutterSecureStorage storage;
  static const themeKey = 'theme';
  static const darkModeValue = 'dark';
  static const lightModeValue = 'light';

  void init() async {
    final theme = await storage.read(key: themeKey);
    if (theme == null) {
      logger.d("Theme is null, setting to light");
      await storage.write(key: themeKey, value: lightModeValue);
    } else {
      logger.d("Theme is $theme");
      _isDarkMode = theme == darkModeValue;
    }
    notifyListeners();
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    await storage.delete(key: themeKey);
    await storage.write(key: themeKey, value: value ? darkModeValue : lightModeValue);
  }
}
