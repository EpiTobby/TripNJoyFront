import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/providers/settings/settings.provider.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/matchmaking.viewmodel.dart';

final matchmakingProvider = ChangeNotifierProvider<MatchmakingViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  final groupViewModel = ref.watch(groupProvider);
  final profileViewModel = ref.watch(profileProvider.notifier);
  final settingsViewModel = ref.watch(settingsProvider);
  return MatchmakingViewModel(
    httpService,
    authViewModel,
    groupViewModel,
    profileViewModel,
    settingsViewModel,
    const FlutterSecureStorage(),
  );
});
