import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/swipe.viewmodel.dart';

final swipeProvider = ChangeNotifierProvider<SwipeViewModel>((ref) {
  final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
  return SwipeViewModel(matchmakingViewModel);
});
