import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation.widget.dart';

import '../api/http.service.dart';

class MatchmakingService extends StateNotifier<List<Widget>> {
  MatchmakingService(this.httpService) : super([]) {
    _init();
  }

  final HttpService httpService;

  // TODO: create a profile state, which will contains the profile data and be sent to then backend

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() {
    state = [
      const ProfileCreation(),
    ];
  }

  void startProfileCreation() {
    // TODO: add all question cards
    state = [
      StandardCard(
          title: "card 1",
          subtitle: "card 1",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  state = state.sublist(1);
                }),
          )),
      StandardCard(
          title: "card 2",
          subtitle: "card 2",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  state = state.sublist(1);
                }),
          )),
      StandardCard(
          title: "card 3",
          subtitle: "card 3",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  state = state.sublist(1);
                }),
          )),
      StandardCard(
          title: "card 4",
          subtitle: "card 4",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  state = state.sublist(1);
                }),
          )),
      StandardCard(
          title: "card 5",
          subtitle: "card 5",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  state = state.sublist(1);
                }),
          )),
    ];
  }
}
