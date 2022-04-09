import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/models/matchmaking/availability.model.dart';
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
import '../log/logger.service.dart';

class MatchmakingService extends StateNotifier<List<CardModel>> {
  MatchmakingService(this.httpService) : super([]) {
    _init();
  }

  final HttpService httpService;

  // TODO: create a profile state, which will contains the profile data and be sent to then backend

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() {
    state = [];
  }

  void startProfileCreation() {
    // TODO: add all question cards

    const DEFAULT_AVATAR_URL =
        "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
    state = [
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "chillOrVisit",
          title: AppLocalizations.of(context).translate("cards.chillOrVisit.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.red,
          values: ["chill", "visit", "any"],
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
          values: ["restaurant", "cook", "any"],
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
          values: ["yes", "no", "any"],
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
          values: ["yes", "no", "any"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => MultipleChoiceCard(
          name: "destinationTypes",
          title: AppLocalizations.of(context).translate("cards.destinationTypes.title"),
          subtitle: AppLocalizations.of(context).translate("cards.destinationTypes.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.darkBlue,
          values: ["mountain", "beach", "city", "countrySide", "naturalArea", "island"],
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
          values: ["yes", "no", "any"],
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
          values: ["yes", "no", "any"],
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
          values: ["yes", "no", "any"],
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
          values: ["men", "women", "any"],
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
        ),
      ),
      CardModel(builder: (context, onTop) => AvailabilityCard()),
      CardModel(builder: (context, onTop) => NameProfileCard()),
    ].toList();
  }

  void nextCard() {
    final newState = state.sublist(1);
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
