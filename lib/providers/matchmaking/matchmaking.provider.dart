import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/matchmaking.viewmodel.dart';

final matchmakingProvider = ChangeNotifierProvider<MatchmakingViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  final profileViewModel = ref.watch(profileProvider.notifier);
  return MatchmakingViewModel(httpService, authViewModel, profileViewModel, const FlutterSecureStorage());
});
