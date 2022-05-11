import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../viewmodels/matchmaking/swipe.viewmodel.dart';
import 'matchmaking.provider.dart';

final swipeProvider = ChangeNotifierProvider<SwipeViewModel>((ref) {
  final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
  return SwipeViewModel(matchmakingViewModel);
});
