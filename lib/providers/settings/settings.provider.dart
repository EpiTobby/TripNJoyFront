import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/settings/settings.viewmodel.dart';

final settingsProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(apiProvider);
  return SettingsViewModel(httpService, const FlutterSecureStorage());
});
