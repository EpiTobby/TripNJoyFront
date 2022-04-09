import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/matchmaking/matchmaking.service.dart';

import '../../models/matchmaking/card.model.dart';
import '../api/api.provider.dart';

final matchmakingProvider = StateNotifierProvider<MatchmakingService, List<CardModel>>((ref) {
  final httpService = ref.watch(codegenProvider);
  return MatchmakingService(httpService);
});
