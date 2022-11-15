import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/matchmaking/matchmaking_status.enum.dart';
import 'package:trip_n_joy_front/models/matchmaking/availability.model.dart';
import 'package:trip_n_joy_front/models/matchmaking/card.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/profile.viewmodel.dart';
import 'package:trip_n_joy_front/viewmodels/settings/settings.viewmodel.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/availability_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/multiple_choice_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/name_profile_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/range_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/swipe_card.widget.dart';

class MatchmakingViewModel extends ChangeNotifier {
  MatchmakingViewModel(
      this.httpService, this.authViewModel, this.profileViewModel, this.settingsViewModel, this.storage) {
    _init();
  }

  final AuthViewModel authViewModel;
  final HttpService httpService;
  final ProfileViewModel profileViewModel;
  final SettingsViewModel settingsViewModel;

  final FlutterSecureStorage storage;
  static const String taskKey = 'taskId';

  List<CardModel> cards = [];
  int index = 0;
  MatchmakingStatus status = MatchmakingStatus.CREATE_PROFILE;
  GroupResponse? groupFound;

  Map<String, dynamic> profileCreationRequest = {};

  // we use a list instead of a stack, because we need to handle user mistakes and go back to the previous card
  void _init() async {
    cards = [];
    final taskStorage = await storage.read(key: taskKey);
    if (taskStorage != null) {
      final taskValue = int.tryParse(taskStorage, radix: 10);
      if (taskValue != null && taskValue >= 0) {
        final matchmakingResult = await httpService.getMatchmakingResult(taskValue);
        if (matchmakingResult == null) {
          await storage.delete(key: taskKey);
          status = MatchmakingStatus.CREATE_PROFILE;
          return;
        }

        groupFound = matchmakingResult.groupId;
        updateMatchmakingStatus(matchmakingResult.type!);
      }
    }
  }

  void startProfileCreation() {
    final isDarkMode = settingsViewModel.isDarkMode;
    cards = [
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "chillOrVisit",
          title: AppLocalizations.of(context).translate("cards.chillOrVisit.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.red : LightCardColors.red,
          isLoading: isLoading,
          values: const ["chill", "visit", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "aboutFood",
          title: AppLocalizations.of(context).translate("cards.aboutFood.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.yellow : LightCardColors.yellow,
          isLoading: isLoading,
          values: const ["restaurant", "cooking", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "goOutAtNight",
          title: AppLocalizations.of(context).translate("cards.goOutAtNight.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.green : LightCardColors.green,
          isLoading: isLoading,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "sport",
          title: AppLocalizations.of(context).translate("cards.sport.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.lightBlue : LightCardColors.lightBlue,
          isLoading: isLoading,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => MultipleChoiceCard(
          name: "destinationTypes",
          title: AppLocalizations.of(context).translate("cards.destinationTypes.title"),
          subtitle: AppLocalizations.of(context).translate("cards.destinationTypes.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.darkBlue : LightCardColors.darkBlue,
          isLoading: isLoading,
          values: const ["mountain", "beach", "city", "countryside"],
          onPressed: submitMultipleChoiceCard,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "travelWithPersonFromSameCity",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCity.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.purple : LightCardColors.purple,
          isLoading: isLoading,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "travelWithPersonFromSameCountry",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCountry.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.pink : LightCardColors.pink,
          isLoading: isLoading,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "travelWithPersonSameLanguage",
          title: AppLocalizations.of(context).translate("cards.travelWithPersonSameLanguage.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.white : LightCardColors.white,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          isLoading: isLoading,
          values: const ["yes", "no", "no_preference"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => SwipeCard(
          name: "gender",
          title: AppLocalizations.of(context).translate("cards.gender.title"),
          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
          onTop: onTop,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.orange : LightCardColors.orange,
          isLoading: isLoading,
          values: const ["male", "female", "mixed"],
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => RangeCard(
          name: "groupSize",
          title: AppLocalizations.of(context).translate("cards.groupSize.title"),
          subtitle: AppLocalizations.of(context).translate("cards.groupSize.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.purple : LightCardColors.white,
          isLoading: isLoading,
          min: 2,
          max: 10,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => RangeCard(
          name: "ages",
          title: AppLocalizations.of(context).translate("cards.ages.title"),
          subtitle: AppLocalizations.of(context).translate("cards.ages.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.red : LightCardColors.red,
          isLoading: isLoading,
          min: 18,
          max: 100,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => RangeCard(
          name: "budget",
          title: AppLocalizations.of(context).translate("cards.budget.title"),
          subtitle: AppLocalizations.of(context).translate("cards.budget.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.yellow : LightCardColors.yellow,
          isLoading: isLoading,
          min: 100,
          max: 2000,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => RangeCard(
          name: "duration",
          title: AppLocalizations.of(context).translate("cards.duration.title"),
          subtitle: AppLocalizations.of(context).translate("cards.duration.subtitle"),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: isDarkMode ? DarkCardColors.green : LightCardColors.green,
          isLoading: isLoading,
          min: 1,
          max: 30,
          onPressed: submitRangeValue,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => AvailabilityCard(
          onPressed: submitAvailability,
          isLoading: isLoading,
        ),
      ),
      CardModel(
        builder: (context, onTop, isLoading) => NameProfileCard(
          onPressed: submitProfile,
          isLoading: isLoading,
        ),
      ),
    ].toList();
    index = 0;
    notifyListeners();
  }

  void previousCard() {
    if (index >= 0) {
      if (index == 0) {
        cards = [];
      }
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
        .map((e) => {
              "startDate": DateFormat('yyyy-MM-dd').format(e.startDate),
              "endDate": DateFormat('yyyy-MM-dd').format(e.endDate)
            })
        .toList();
    nextCard();
  }

  void joinGroup() {
    status = MatchmakingStatus.CREATE_PROFILE;
    cards = [];
    index = 0;
    notifyListeners();
  }

  Future<void> handleMatchmakingResponse(MatchMakingResponse? matchmakingResponse) async {
    if (matchmakingResponse == null) {
      status = MatchmakingStatus.CREATE_PROFILE;
      notifyListeners();
      return;
    }

    final taskResponse = matchmakingResponse.taskId;

    await storage.delete(key: taskKey);
    await storage.write(key: taskKey, value: taskResponse.toString());

    final matchmakingResult = await httpService.getMatchmakingResult(taskResponse!.toInt());
    if (matchmakingResult == null) {
      status = MatchmakingStatus.CREATE_PROFILE;
      notifyListeners();
      return;
    }

    groupFound = matchmakingResult.group;
    updateMatchmakingStatus(matchmakingResult.type!);
  }

  Future<void> retryMatchmaking(int profileId, int? groupId) async {
    int? id = httpService.getUserIdFromToken(authViewModel.token!);
    if (groupId != null) {
      await httpService.leaveGroup(groupId, id!);
    }

    final matchmakingResponse = await httpService.retryMatchmaking(id!, profileId);
    await handleMatchmakingResponse(matchmakingResponse);
  }

  Future<void> retryMatchmakingNoProfile(int? groupId) async {
    int? id = httpService.getUserIdFromToken(authViewModel.token!);
    if (groupId != null) {
      await httpService.leaveGroup(groupId, id!);
    }
    status = MatchmakingStatus.CREATE_PROFILE;
    notifyListeners();
  }

  void submitProfile(String name, String value) async {
    status = MatchmakingStatus.WAITING_MATCHMAKING;
    submitCard(name, value);

    int? id = httpService.getUserIdFromToken(authViewModel.token!);

    final matchmakingResponse =
        await httpService.startMatchmaking(id!, ProfileCreationRequest.fromJsonFactory(profileCreationRequest));
    profileCreationRequest = {};

    await handleMatchmakingResponse(matchmakingResponse);

    await profileViewModel.getUserProfiles();
  }

  Future<void> mockMatchmaking() async {
    await Future.delayed(const Duration(seconds: 2));
    receiveGroupMatch();
  }

  void restartProfileCreation() async {
    status = MatchmakingStatus.CREATE_PROFILE;
    cards = [];
    index = 0;
    notifyListeners();
  }

  void receiveGroupMatch() async {
    status = MatchmakingStatus.JOIN_GROUP;
    notifyListeners();
  }

  void updateMatchmakingStatus(MatchMakingResultType$ matchMakingResultType) async {
    switch (matchMakingResultType) {
      case MatchMakingResultType$.created:
        status = MatchmakingStatus.JOIN_GROUP;
        break;
      case MatchMakingResultType$.joined:
        status = MatchmakingStatus.JOIN_GROUP;
        break;
      case MatchMakingResultType$.waiting:
        status = MatchmakingStatus.NO_GROUP;
        break;
      case MatchMakingResultType$.searching:
        status = MatchmakingStatus.WAITING_MATCHMAKING;
        break;
      default:
        status = MatchmakingStatus.CREATE_PROFILE;
        await storage.delete(key: taskKey);
        break;
    }
    notifyListeners();
  }
}
