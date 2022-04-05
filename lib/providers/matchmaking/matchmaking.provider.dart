import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/services/matchmaking/matchmaking.service.dart';

import '../api/api.provider.dart';

final matchmakingProvider = StateNotifierProvider<MatchmakingService, List<Widget>>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authService = ref.watch(authProvider);
  return MatchmakingService(httpService, authService);
});
