import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/models/matchmaking/availability.model.dart';
import 'package:trip_n_joy_front/services/matchmaking/profile.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/group_found_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/multiple_choice_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/swipe_card.widget.dart';

import '../../models/matchmaking/card.model.dart';
import '../../widgets/matchmaking/cards/availability_card.widget.dart';
import '../../widgets/matchmaking/cards/name_profile_card.widget.dart';
import '../../widgets/matchmaking/cards/range_card.widget.dart';
import '../api/http.service.dart';

import '../auth/auth.service.dart';

import '../log/logger.service.dart';


class MatchmakingService extends ChangeNotifier {
  MatchmakingService(this.httpService, this.authService, this.profileService) {
    _init();
  }

  final AuthService authService;
  final HttpService httpService;
  final ProfileService profileService;
  List<CardModel> cards = [];
  int index = 0;

  ProfileModel? activeProfile;
  Map<String, dynamic> profileCreationRequest = {};

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() {
    cards = [];
  }

  void startProfileCreation() {
    // TODO: add all question cards

    const DEFAULT_AVATAR_URL =
        "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
    cards = [
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "chillOrVisit",
          title: AppLocalizations.of(context).translate("cards.chillOrVisit.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.red,
          values: const ["chill", "visit", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "aboutFood",
          title: AppLocalizations.of(context).translate("cards.aboutFood.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.yellow,
          values: const ["restaurant", "cooking", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "goOutAtNight",
          title: AppLocalizations.of(context).translate("cards.goOutAtNight.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.green,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "sport",
          title: AppLocalizations.of(context).translate("cards.sport.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.lightBlue,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => MultipleChoiceCard(
          name: "destinationTypes",
          title: AppLocalizations.of(context).translate("cards.destinationTypes.title"),
          subtitle: AppLocalizations.of(context).translate("cards.destinationTypes.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.darkBlue,
          values: const ["mountain", "beach", "city", "countryside"],
          onPressed: submitMultipleChoiceCard,
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonFromSameCity",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCity.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.purple,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonFromSameCountry",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCountry.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.pink,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonSameLanguage",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonSameLanguage.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.white,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "gender",
          title: AppLocalizations.of(context).translate("cards.gender.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.orange,
          values: const ["male", "female", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "groupSize",
          title: AppLocalizations.of(context).translate("cards.groupSize.title"),
          subtitle: AppLocalizations.of(context).translate("cards.groupSize.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.purple,
          min: 2,
          max: 10,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "ages",
          title: AppLocalizations.of(context).translate("cards.ages.title"),
          subtitle: AppLocalizations.of(context).translate("cards.ages.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.red,
          min: 18,
          max: 100,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "budget",
          title: AppLocalizations.of(context).translate("cards.budget.title"),
          subtitle: AppLocalizations.of(context).translate("cards.budget.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.yellow,
          min: 100,
          max: 2000,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "duration",
          title: AppLocalizations.of(context).translate("cards.duration.title"),
          subtitle: AppLocalizations.of(context).translate("cards.duration.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.green,
          min: 1,
          max: 30,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
          builder: (context, onTop) => AvailabilityCard(
                onPressed: submitAvailability,
              )),
      CardModel(
          builder: (context, onTop) => NameProfileCard(
                onPressed: submitProfile,
              )),
    ].toList();
    index = 0;
    notifyListeners();
  }

  void previousCard() {
    if (index > 0) {
      index--;
      notifyListeners();
    }
  }

  void nextCard() {
    index++;
    notifyListeners();
  }

  void submitCard(String name, String value) {
    logger.i("submitCard: $name, value: $value");
    profileCreationRequest[name] = value.toUpperCase();
    nextCard();
  }

  void submitMultipleChoiceCard(String name, List<String> values) {
    logger.i("Submit $name - values: ${values.join(", ")}");
    profileCreationRequest[name] = values.map((e) => e.toUpperCase()).toList();
    nextCard();
  }

  void submitRangeValue(String name, RangeValues values) {
    logger.i("Submit $name - values: ${values.start} - ${values.end}");
    profileCreationRequest[name] = {"minValue": values.start.toInt(), "maxValue": values.end.toInt()};
    nextCard();
  }

  void submitAvailability(String name, List<Availability> availabilities) {
    logger.i(
        "Submit $name - availabilities: ${availabilities.map((e) => "begin: ${e.startDate} - end: ${e.endDate}").join(", ")}");
    profileCreationRequest[name] = availabilities
        .map((e) => {"startDate": e.startDate.toIso8601String(), "endDate": e.endDate.toIso8601String()})
        .toList();
    nextCard();
  }

  void joinGroup(int groupId) {
    nextCard();
  }

  void matchmaking() {}

  void retryMatchmaking() {}

  void submitProfile(String name, String value) {
    submitCard(name, value);
    createProfile();
  }

  void createProfile() {
    profileService.createProfile(ProfileCreationRequest.fromJsonFactory(profileCreationRequest));
  }

  void mockProfileData() {
    profileCreationRequest["duration"] = {"minValue": 1, "maxValue": 10};
    profileCreationRequest["budget"] = {"minValue": 1, "maxValue": 10};
    profileCreationRequest["destinationTypes"] = ["CITY"];
    profileCreationRequest["ages"] = {"minValue": 18, "maxValue": 100};
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
