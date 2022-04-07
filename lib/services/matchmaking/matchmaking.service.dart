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
  ProfileModel? activeProfile;
  Map<String, dynamic> profileCreationRequest = {};

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() async {
    state = [
      const ProfileCreationCard(),
    ];

    if (authService.token != null) {
      getUserProfiles();
    }
  }

  void startProfileCreation() {
    // TODO: add all question cards

    const DEFAULT_AVATAR_URL =
        "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
    state = [
      const NameProfileCard(),
      const AvailabilityCard(),
      const GroupFoundCard(
          groupId: 1,
          groupPhotoUrl: DEFAULT_AVATAR_URL,
          membersPhotoUrls: [DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL]),
      const RangeCard(
          name: "groupSize",
          title: 'How many people are you looking for?',
          subtitle: "Select the range of people you are looking for",
          min: 1,
          max: 15,
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
                  createProfile();
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
    logger.i("Submit ${name} - values: ${values.start} - ${values.end}");
    profileCreationRequest[name] = {"minValue": values.start.toInt(), "maxValue": values.end.toInt()};
    nextCard();
  }

  void submitAvailability(String name, List<Availability> availabilities) {
    logger.i(
        "Submit ${name} - availabilities: ${availabilities.map((e) => "begin: ${e.startDate} - end: ${e.endDate}").join(", ")}");
    profileCreationRequest[name] =
        availabilities.map((e) => {"startDate": e.startDate.toIso8601String(), "endDate": e.endDate.toIso8601String()});
    nextCard();
  }

  void joinGroup(int groupId) {
    nextCard();
  }

  void matchmaking() {}

  void retryMatchmaking() {}

  void createProfile() async {
    nextCard();

    mockProfileData();

    int? id = httpService.getUserIdFromToken(authService.token!);
    var profileModel =
        await httpService.createProfile(id!, ProfileCreationRequest.fromJsonFactory(profileCreationRequest));
    profiles.add(profileModel!);
    activeProfile = profileModel;
  }

  void getUserProfiles() async {
    var id = httpService.getUserIdFromToken(authService.token!);
    List<ProfileModel>? userProfiles = await httpService.getUserProfiles(id!);
    profiles.addAll(userProfiles!);
  }

  void updateProfile(int profileId) async {
    int? id = httpService.getUserIdFromToken(authService.token!);

    await httpService.updateProfile(id!, profileId, ProfileUpdateRequest.fromJsonFactory({}));
  }

  void deleteProfile(int profileId) async {
    int? id = httpService.getUserIdFromToken(authService.token!);

    await httpService.deleteProfile(id!, profileId);
  }

  void mockProfileData() {
    profileCreationRequest["duration"] = {"minValue": 1, "maxValue": 10};
    profileCreationRequest["budget"] = {"minValue": 1, "maxValue": 10};
    profileCreationRequest["destinationTypes"] = ["CITY"];
    profileCreationRequest["ages"] = {"minValue": 1, "maxValue": 10};
    profileCreationRequest["travelWithPersonFromSameCity"] = "YES";
    profileCreationRequest["travelWithPersonFromSameCountry"] = "YES";
    profileCreationRequest["travelWithPersonSameLanguage"] = "YES";
    profileCreationRequest["gender"] = "MALE";
    profileCreationRequest["chillOrVisit"] = "VISIT";
    profileCreationRequest["aboutFood"] = "RESTAURANT";
    profileCreationRequest["goOutAtNight"] = "NO_PREFERENCE";
    profileCreationRequest["sport"] = "NO";
  }
}
