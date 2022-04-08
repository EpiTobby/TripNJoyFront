import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          title: "Vacances chill ou pour visiter ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.red,
          values: ["Chill", "Visite", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "aboutFood",
          title: "Plutôt restaurant ou cuisine ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.yellow,
          values: ["Restaurant", "Cuisine", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "goOutAtNight",
          title: "Plutôt sortir le soir, ou le matin ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.green,
          values: ["Soir", "Matin", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "sport",
          title: "Activité sportive ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.lightBlue,
          values: ["Oui", "Non", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => MultipleChoiceCard(
          name: "destinationTypes",
          title: "Quel type de destination ?",
          subtitle: "Veuillez choisir les types de destination que vous souhaitez visiter",
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.darkBlue,
          values: ["Montagne", "Plage", "Ville", "Campagne", "Îles", "Espace naturel"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonFromSameCity",
          title: "Partir avec des gens de la même ville ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.purple,
          values: ["Oui", "Non", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonFromSameCountry",
          title: "Partir avec des gens du même pays ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.pink,
          values: ["Oui", "Non", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "travelWithPersonSameLanguage",
          title: "Personnes parlant la même langue que soi ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.white,
          values: ["Oui", "Non", "N'importe"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => SwipeCard(
          name: "gender",
          title: "Sexe des personnes avec qui voyager ?",
          subtitle: "Swiper pour choisir",
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.orange,
          values: ["Homme", "Femme", "Mixte"],
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "groupSize",
          title: "Combien de personnes voulez-vous partir avec ?",
          subtitle: "Saississez un nombre entre 2 et 10+",
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.purple,
          min: 2,
          max: 10,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "ages",
          title: "Age des personnes avec qui voyager ?",
          subtitle: "Saississez un intervalle entre 18 et 100+ ans",
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.red,
          min: 18,
          max: 100,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "budget",
          title: "Quel est votre budget ?",
          subtitle: "Saississez un intervalle entre 100€ et 2000+€",
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.yellow,
          min: 100,
          max: 2000,
        ),
      ),
      CardModel(
        builder: (context, onTop) => RangeCard(
          name: "duration",
          title: "Combien de temps voulez-vous partir ?",
          subtitle: "Saississez un intervalle entre 1 et 30+ jours",
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: CardColors.green,
          min: 1,
          max: 30,
        ),
      ),
      CardModel(builder: (context, onTop) => AvailabilityCard()),
      CardModel(builder: (context, onTop) => NameProfileCard()),
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
