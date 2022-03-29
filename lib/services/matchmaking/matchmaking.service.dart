import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation.widget.dart';

import '../api/http.service.dart';

class MatchmakingService extends StateNotifier<List<Widget>> {
  MatchmakingService(this.httpService) : super([]) {
    _init();
  }

  final HttpService httpService;

  void _init() {
    state = [
      ProfileCreation(),
    ];
  }

  void startProfileCreation() {
    state = [StandardCard(title: "hello", subtitle: "tello", child: Text('Profile Creation'))];
  }
}
