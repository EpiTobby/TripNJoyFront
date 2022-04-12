import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';

import '../../viewmodels/matchmaking/matchmaking.viewmodel.dart';
import '../api/api.provider.dart';

final matchmakingProvider = ChangeNotifierProvider<MatchmakingViewModel>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authViewModel = ref.watch(authProvider);
  final profileViewModel = ref.watch(profileProvider.notifier);
  return MatchmakingViewModel(httpService, authViewModel, profileViewModel);
});
