import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/matchmaking/matchmaking_status.enum.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/availability_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/multiple_choice_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/range_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/swipe_card.widget.dart';

import '../common/input_dialog.widget.dart';

class ProfileDetail extends ConsumerWidget {
  const ProfileDetail({Key? key, required this.profileId}) : super(key: key);

  final int profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileModels = ref.watch(profileProvider);
    final profileModel = profileModels!.firstWhere((profile) => profile.id == profileId);
    final profileViewModel = ref.watch(profileProvider.notifier);
    final matchmakingStatus = ref.watch(matchmakingProvider).status;

    final updateProfileSwap = (name, value) async {
      await profileViewModel.updateProfile(
          profileModel.id!.toInt(), ProfileUpdateRequest.fromJsonFactory({name: value}));
      Navigator.pop(context);
    };

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(AppLocalizations.of(context).translate('profile.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: ListView(children: [
        LayoutBox(title: AppLocalizations.of(context).translate('profile.information'), children: [
          LayoutItem(
            title: AppLocalizations.of(context).translate('profile.name'),
            child: LayoutItemValue(
              value: profileModel.name!,
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                          title: AppLocalizations.of(context).translate("profile.name"),
                          label: AppLocalizations.of(context).translate("profile.name"),
                          initialValue: profileModel.name!,
                          onConfirm: (value) async {
                            profileViewModel.updateProfile(
                                profileModel.id!.toInt(),
                                ProfileUpdateRequest.fromJsonFactory({
                                  "name": value,
                                }));
                          });
                    });
              },
            ),
          )
        ]),
        LayoutBox(title: AppLocalizations.of(context).translate('profile.answers'), children: [
          LayoutItem(
            title: AppLocalizations.of(context).translate("cards.availability.title"),
            child: LayoutItemValue(
              value: profileModel.availabilities!
                  .map((availability) => availability.startDate != null
                      ? DateFormat('dd/MM/yyyy', AppLocalizations.instance.locale.countryCode)
                              .format(DateTime.parse(availability.startDate!)) +
                          ' - ' +
                          DateFormat('dd/MM/yyyy').format(DateTime.parse(availability.endDate!))
                      : '')
                  .join(' ; '),
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: AvailabilityCard(onPressed: (name, value) async {
                          await profileViewModel.updateProfile(
                              profileModel.id!.toInt(),
                              ProfileUpdateRequest.fromJsonFactory({
                                name: value
                                    .map((e) => {
                                          "startDate": e.startDate.toIso8601String(),
                                          "endDate": e.endDate.toIso8601String()
                                        })
                                    .toList()
                              }));
                          Navigator.pop(context);
                        }),
                      );
                    });
              },
            ),
          ),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.duration.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate('profile.rangeAnswer', {
                    'begin': profileModel.duration!.minValue.toString(),
                    'end': profileModel.duration!.maxValue.toString(),
                    'val': AppLocalizations.of(context).translate('common.days')
                  }),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: RangeCard(
                                name: "duration",
                                title: AppLocalizations.of(context).translate("cards.duration.title"),
                                subtitle: AppLocalizations.of(context).translate("cards.duration.subtitle"),
                                min: 1,
                                max: 30,
                                color: CColors.primary,
                                backgroundColor: CardColors.yellow,
                                onPressed: (name, value) {
                                  profileViewModel.updateProfile(
                                      profileModel.id!.toInt(),
                                      ProfileUpdateRequest.fromJsonFactory({
                                        name: {
                                          "minValue": value.start.round().toInt(),
                                          "maxValue": value.end.round().toInt()
                                        }
                                      }));
                                  Navigator.pop(context);
                                }),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.budget.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate('profile.rangeAnswer', {
                    'begin': profileModel.budget!.minValue.toString(),
                    'end': profileModel.budget!.maxValue.toString(),
                    'val': "€"
                  }),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: RangeCard(
                                name: "budget",
                                title: AppLocalizations.of(context).translate("cards.budget.title"),
                                subtitle: AppLocalizations.of(context).translate("cards.budget.subtitle"),
                                min: 100,
                                max: 2000,
                                color: CColors.primary,
                                backgroundColor: CardColors.yellow,
                                onPressed: (name, value) {
                                  profileViewModel.updateProfile(
                                      profileModel.id!.toInt(),
                                      ProfileUpdateRequest.fromJsonFactory({
                                        name: {
                                          "minValue": value.start.round().toInt(),
                                          "maxValue": value.end.round().toInt()
                                        }
                                      }));

                                  Navigator.pop(context);
                                }),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.ages.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate('profile.rangeAnswer', {
                    'begin': profileModel.ages!.minValue.toString(),
                    'end': profileModel.ages!.maxValue.toString(),
                    'val': AppLocalizations.of(context).translate('common.yearsOld')
                  }),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: RangeCard(
                                name: "ages",
                                title: AppLocalizations.of(context).translate("cards.ages.title"),
                                subtitle: AppLocalizations.of(context).translate("cards.ages.subtitle"),
                                min: 18,
                                max: 100,
                                color: CColors.primary,
                                backgroundColor: CardColors.yellow,
                                onPressed: (name, value) {
                                  profileViewModel.updateProfile(
                                      profileModel.id!.toInt(),
                                      ProfileUpdateRequest.fromJsonFactory({
                                        name: {
                                          "minValue": value.start.round().toInt(),
                                          "maxValue": value.end.round().toInt()
                                        }
                                      }));

                                  Navigator.pop(context);
                                }),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.groupSize.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate('profile.rangeAnswer', {
                    'begin': profileModel.groupSize!.minValue.toString(),
                    'end': profileModel.groupSize!.maxValue.toString(),
                    'val': AppLocalizations.of(context).translate('common.people')
                  }),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: RangeCard(
                                name: "groupSize",
                                title: AppLocalizations.of(context).translate("cards.groupSize.title"),
                                subtitle: AppLocalizations.of(context).translate("cards.groupSize.subtitle"),
                                min: 2,
                                max: 10,
                                color: CColors.primary,
                                backgroundColor: CardColors.yellow,
                                onPressed: (name, value) {
                                  profileViewModel.updateProfile(
                                      profileModel.id!.toInt(),
                                      ProfileUpdateRequest.fromJsonFactory({
                                        name: {
                                          "minValue": value.start.round().toInt(),
                                          "maxValue": value.end.round().toInt()
                                        }
                                      }));

                                  Navigator.pop(context);
                                }),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.gender.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate('cards.gender.${profileModel.gender!.name}'),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: SwipeCard(
                              name: "gender",
                              title: AppLocalizations.of(context).translate("cards.gender.title"),
                              subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                              onTop: true,
                              color: Theme.of(context).colorScheme.primary,
                              backgroundColor: CardColors.green,
                              values: const ["male", "female", "no_preference"],
                              updateProfile: updateProfileSwap,
                            ),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.travelWithPersonSameLanguage.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate(
                      "cards.travelWithPersonSameLanguage.${profileModel.travelWithPersonSameLanguage!.name}"),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: SwipeCard(
                              name: "travelWithPersonSameLanguage",
                              title: AppLocalizations.of(context).translate("cards.travelWithPersonSameLanguage.title"),
                              subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                              onTop: true,
                              color: Theme.of(context).colorScheme.primary,
                              backgroundColor: CardColors.green,
                              values: const ["yes", "no", "no_preference"],
                              updateProfile: updateProfileSwap,
                            ),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCountry.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate(
                      "cards.travelWithPersonFromSameCountry.${profileModel.travelWithPersonFromSameCountry!.name}"),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: SwipeCard(
                              name: "travelWithPersonFromSameCountry",
                              title:
                                  AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCountry.title"),
                              subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                              onTop: true,
                              color: Theme.of(context).colorScheme.primary,
                              backgroundColor: CardColors.green,
                              values: const ["yes", "no", "no_preference"],
                              updateProfile: updateProfileSwap,
                            ),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCity.title"),
              child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate(
                      "cards.travelWithPersonFromSameCity.${profileModel.travelWithPersonFromSameCity!.name}"),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: SwipeCard(
                              name: "travelWithPersonFromSameCity",
                              title: AppLocalizations.of(context).translate("cards.travelWithPersonFromSameCity.title"),
                              subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                              onTop: true,
                              color: Theme.of(context).colorScheme.primary,
                              backgroundColor: CardColors.green,
                              values: const ["yes", "no", "no_preference"],
                              updateProfile: updateProfileSwap,
                            ),
                          );
                        });
                  })),
          LayoutItem(
              title: AppLocalizations.of(context).translate("cards.destinationTypes.title"),
              child: LayoutItemValue(
                  value: profileModel.destinationTypes!
                      .map((e) => AppLocalizations.of(context).translate("cards.destinationTypes.${e.name}"))
                      .join(', '),
                  editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: MultipleChoiceCard(
                              name: "destinationTypes",
                              title: AppLocalizations.of(context).translate("cards.destinationTypes.title"),
                              subtitle: AppLocalizations.of(context).translate("cards.destinationTypes.subtitle"),
                              color: Theme.of(context).colorScheme.primary,
                              backgroundColor: CardColors.darkBlue,
                              values: const ["mountain", "beach", "city", "countryside"],
                              onPressed: (name, value) {
                                profileViewModel.updateProfile(
                                    profileModel.id!.toInt(), ProfileUpdateRequest.fromJsonFactory({name: value}));
                                Navigator.pop(context);
                              },
                            ),
                          );
                        });
                  })),
          LayoutItem(
            title: AppLocalizations.of(context).translate("cards.sport.title"),
            child: LayoutItemValue(
              value: AppLocalizations.of(context).translate("cards.sport.${profileModel.sport!.name}"),
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: SwipeCard(
                          name: "sport",
                          title: AppLocalizations.of(context).translate("cards.sport.title"),
                          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                          onTop: true,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: CardColors.lightBlue,
                          values: const ["yes", "no", "no_preference"],
                          updateProfile: updateProfileSwap,
                        ),
                      );
                    });
              },
            ),
          ),
          LayoutItem(
            title: AppLocalizations.of(context).translate("cards.goOutAtNight.title"),
            child: LayoutItemValue(
              value: AppLocalizations.of(context).translate("cards.goOutAtNight.${profileModel.goOutAtNight!.name}"),
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: SwipeCard(
                          name: "goOutAtNight",
                          title: AppLocalizations.of(context).translate("cards.goOutAtNight.title"),
                          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                          onTop: true,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: CardColors.lightBlue,
                          values: const ["yes", "no", "no_preference"],
                          updateProfile: updateProfileSwap,
                        ),
                      );
                    });
              },
            ),
          ),
          LayoutItem(
            title: AppLocalizations.of(context).translate("cards.aboutFood.title"),
            child: LayoutItemValue(
              value: AppLocalizations.of(context).translate("cards.aboutFood.${profileModel.aboutFood!.name}"),
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: SwipeCard(
                          name: "aboutFood",
                          title: AppLocalizations.of(context).translate("cards.aboutFood.title"),
                          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                          onTop: true,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: CardColors.yellow,
                          values: const ["restaurant", "cook", "no_preference"],
                          updateProfile: updateProfileSwap,
                        ),
                      );
                    });
              },
            ),
          ),
          LayoutItem(
            title: AppLocalizations.of(context).translate("cards.chillOrVisit.title"),
            child: LayoutItemValue(
              value: AppLocalizations.of(context).translate("cards.chillOrVisit.${profileModel.chillOrVisit!.name}"),
              editable: matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: SwipeCard(
                          name: "chillOrVisit",
                          title: AppLocalizations.of(context).translate("cards.chillOrVisit.title"),
                          subtitle: AppLocalizations.of(context).translate("cards.swipeToChoose"),
                          onTop: true,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: CardColors.red,
                          values: const ["chill", "visit", "no_preference"],
                          updateProfile: updateProfileSwap,
                        ),
                      );
                    });
              },
            ),
          )
        ]),
      ]),
    );
  }
}
