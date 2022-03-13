import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/dio.provider.dart';

import '../../services/settings/settings.service.dart';
import '../user/user.provider.dart';

final settingsProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(dioProvider);
  return SettingsService(httpService);
});
