import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';

import '../../viewmodels/settings/settings.viewmodel.dart';

final settingsProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(codegenProvider);
  return SettingsViewModel(httpService);
});
