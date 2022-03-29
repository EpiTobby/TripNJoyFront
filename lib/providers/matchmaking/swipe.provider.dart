import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/matchmaking/swipe.service.dart';

final swipeProvider = ChangeNotifierProvider<SwipeService>((ref) {
  return SwipeService();
});
