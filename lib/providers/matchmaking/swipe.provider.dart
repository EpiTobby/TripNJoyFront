import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/matchmaking/matchmaking.service.dart';
import 'package:trip_n_joy_front/services/matchmaking/swipe.service.dart';

import 'matchmaking.provider.dart';

final swipeProvider = ChangeNotifierProvider<SwipeService>((ref) {
  final matchmakingService = ref.watch(matchmakingProvider.notifier);
  return SwipeService(matchmakingService);
});
