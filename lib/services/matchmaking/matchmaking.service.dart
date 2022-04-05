import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/models/matchmaking/availability.model.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/group_found_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/multiple_choice_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/swipe_card.widget.dart';

import '../../widgets/matchmaking/cards/availability_card.widget.dart';
import '../../widgets/matchmaking/cards/name_profile_card.widget.dart';
import '../../widgets/matchmaking/cards/range_card.widget.dart';
import '../api/http.service.dart';

import '../auth/auth.service.dart';

import '../log/logger.service.dart';

class MatchmakingService extends StateNotifier<List<Widget>> {
  MatchmakingService(this.httpService, this.authService) : super([]) {
    _init();
  }

  final AuthService authService;
  final HttpService httpService;
  final List<ProfileModel> profiles = [];
  Map<String, dynamic> profileCreationRequest = {};

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() async {
    state = [
      const ProfileCreationCard(),
    ];

    var id = httpService.getUserIdFromToken(authService.token!);
    List<ProfileModel>? userProfiles = await httpService.getUserProfiles(id!);
    profiles.addAll(userProfiles!);
  }

  void startProfileCreation() {
    // TODO: add all question cards

    const DEFAULT_AVATAR_URL =
        "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
    state = [
      const AvailabilityCard(),
      const GroupFoundCard(
          groupId: 1,
          groupPhotoUrl: DEFAULT_AVATAR_URL,
          membersPhotoUrls: [DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL]),
      const RangeCard(
          name: "number_people",
          title: 'How many people are you looking for?',
          subtitle: "Select the range of people you are looking for",
          min: 18,
          max: 100,
          color: CColors.primary,
          backgroundColor: CardColors.yellow),
      const MultipleChoiceCard(
          name: "activities",
          title: "What are your interests?",
          subtitle: "Select all that apply",
          color: CColors.primary,
          backgroundColor: CardColors.pink,
          values: ["sport", "culture", "food", "nature", "shopping", "sightseeing", "other"]),
      const MultipleChoiceCard(
          name: "activities",
          title: "What are your interests?",
          subtitle: "Select all that apply",
          color: CColors.primary,
          backgroundColor: CardColors.darkBlue,
          values: ["sport", "culture", "food", "nature", "shopping", "sightseeing", "other"]),
      const MultipleChoiceCard(
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
    logger.i("submitCard: $name, value: $value");
    profileCreationRequest[name] = value;
    nextCard();
  }

  void submitMultipleChoiceCard(String name, List<String> values) {
    logger.i("Submit ${name} - values: ${values.join(", ")}");
    profileCreationRequest[name] = values;
    nextCard();
  }

  void submitRangeValue(String name, RangeValues values) {
    // TODO: populate profile object
    logger.i("Submit ${name} - values: ${values.start} - ${values.end}");

    nextCard();
  }


  void createProfile(String token) async {
    int? id = httpService.getUserIdFromToken(token);
    await httpService.createProfile(id!, ProfileCreationRequest.fromJsonFactory({}));
  }

  void submitAvailability(String name, List<Availability> availabilities) {
    // TODO: populate profile object
    logger.i(
        "Submit ${name} - availabilities: ${availabilities.map((e) => "begin: ${e.startDate} - end: ${e.endDate}").join(", ")}");
    nextCard();
  }

  void joinGroup(int groupId) {
    nextCard();
  }

  void matchmaking() {}

  void retryMatchmaking() {}
}
