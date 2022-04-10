import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/services/matchmaking/matchmaking.service.dart';

import '../../models/matchmaking/card.model.dart';
import '../api/api.provider.dart';

final matchmakingProvider = ChangeNotifierProvider<MatchmakingService>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authService = ref.watch(authProvider);
  final profileService = ref.watch(profileProvider.notifier);
  return MatchmakingService(httpService, authService, profileService);
});
