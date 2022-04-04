import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/group_found_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/multiple_choice_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/swipe_card.widget.dart';

import '../../widgets/matchmaking/cards/name_profile_card.widget.dart';
import '../../widgets/matchmaking/cards/range_card.widget.dart';
import '../api/http.service.dart';
import '../log/logger.service.dart';

class MatchmakingService extends StateNotifier<List<Widget>> {
  MatchmakingService(this.httpService) : super([]) {
    _init();
  }

  final HttpService httpService;

  // TODO: create a profile state, which will contains the profile data and be sent to then backend

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() {
    state = [
      const ProfileCreationCard(),
    ];
  }

  void startProfileCreation() {
    // TODO: add all question cards

    const DEFAULT_AVATAR_URL =
        "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
    state = [
      GroupFoundCard(
          groupId: 1,
          groupPhotoUrl: DEFAULT_AVATAR_URL,
          membersPhotoUrls: [DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL]),
      RangeCard(
          name: "number_people",
          title: 'How many people are you looking for?',
          subtitle: "Select the range of people you are looking for",
          min: 18,
          max: 100,
          color: CColors.primary,
          backgroundColor: CardColors.yellow),
      MultipleChoiceCard(
          name: "activities",
          title: "What are your interests?",
          subtitle: "Select all that apply",
          color: CColors.primary,
          backgroundColor: CardColors.pink,
          values: ["sport", "culture", "food", "nature", "shopping", "sightseeing", "other"]),
      MultipleChoiceCard(
          name: "activities",
          title: "What are your interests?",
          subtitle: "Select all that apply",
          color: CColors.primary,
          backgroundColor: CardColors.darkBlue,
          values: ["sport", "culture", "food", "nature", "shopping", "sightseeing", "other"]),
      MultipleChoiceCard(
          name: "activities",
          title: "What are your interests?",
          subtitle: "Select all that apply",
          color: CColors.primary,
          backgroundColor: CardColors.green,
          values: ["sport", "culture", "food", "nature", "shopping", "sightseeing", "other"]),
      StandardCard(
          title: "card 1",
          subtitle: "card 1",
          shadowColor: CColors.secondary.withOpacity(0.5),
          child: Center(
            child: PrimaryButton(
                text: "Pop!",
                onPressed: () {
                  nextCard();
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
                  nextCard();
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
                  nextCard();
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
                  nextCard();
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
                  nextCard();
                }),
          )),
    ].reversed.toList();
  }

  void nextCard() {
    final newState = state.sublist(0, state.length - 1);
    state = newState;
  }

  void submitCard(String name, String value) {
    // TODO: populate profile object
    logger.i("submitCard: $name, value: $value");
    // profile[name] = value;
    nextCard();
  }

  void submitMultipleChoiceCard(String name, List<String> values) {
    // TODO: populate profile object
    logger.i("Submit ${name} - values: ${values.join(", ")}");
    nextCard();
  }

  void submitRangeValue(String name, RangeValues values) {
    // TODO: populate profile object
    logger.i("Submit ${name} - values: ${values.start} - ${values.end}");
    nextCard();
  }

  void joinGroup(int groupId) {
    nextCard();
  }

  void matchmaking() {}

  void retryMatchmaking() {}
}
