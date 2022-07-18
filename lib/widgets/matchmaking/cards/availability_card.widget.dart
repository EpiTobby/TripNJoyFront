import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/date_picker.widget.dart';

import '../../../models/matchmaking/availability.model.dart';
import '../../common/button.widget.dart';

class AvailabilityCard extends HookConsumerWidget {
  const AvailabilityCard({Key? key, this.isLoading = false, required this.onPressed}) : super(key: key);

  final bool isLoading;
  final name = "availabilities";
  final Function onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offset = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
    final availabilities =
        useState<List<Availability>>([Availability(startDate: DateTime.now(), endDate: DateTime.now())]);
    final scrollController = useState(ScrollController());
    return SlideTransition(
      position: offset,
      child: StandardCard(
        name: "NameProfileCard",
        title: AppLocalizations.of(context).translate("cards.availability.title"),
        subtitle: AppLocalizations.of(context).translate("cards.availability.subtitle"),
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        isLoading: isLoading,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                interactive: false,
                controller: scrollController.value,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  controller: scrollController.value,
                  children: <Widget>[
                    for (final availability in availabilities.value)
                      AvailabilityInput(
                        availability: availability,
                        onStartChanged: (value) {
                          availabilities.value = availabilities.value.map((a) {
                            if (a == availability) {
                              a.startDate = value;
                              if (a.endDate.isBefore(value)) {
                                a.endDate = value;
                              }
                            }
                            return a;
                          }).toList();
                        },
                        onEndChanged: (value) {
                          availabilities.value = availabilities.value.map((a) {
                            if (a == availability) {
                              a.endDate = value;
                            }
                            return a;
                          }).toList();
                        },
                        onDelete: availabilities.value.length > 1
                            ? () {
                                availabilities.value =
                                    availabilities.value.where((element) => element != availability).toList();
                                scrollController.value
                                    .animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              }
                            : null,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PrimaryButton(
                          text: "+",
                          fitContent: true,
                          onPressed: () {
                            availabilities.value = [
                              ...availabilities.value,
                              Availability(startDate: DateTime.now(), endDate: DateTime.now())
                            ];
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                scrollController.value.animateTo(scrollController.value.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              text: AppLocalizations.of(context).translate('common.validate'),
              isDisabled: availabilities.value.isEmpty,
              onPressed: () {
                animation.forward().whenComplete(() {
                  onPressed(name, availabilities.value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AvailabilityInput extends HookConsumerWidget {
  const AvailabilityInput({
    Key? key,
    required this.availability,
    required this.onStartChanged,
    required this.onEndChanged,
    this.onDelete,
  }) : super(key: key);
  final Availability availability;
  final void Function(DateTime) onStartChanged;
  final void Function(DateTime) onEndChanged;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 110,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
                    top: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
                    bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
                    right: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0), width: 3),
                  ),
                ),
              ),
              IconButton(
                  onPressed: onDelete, icon: const Icon(Icons.delete), color: Theme.of(context).colorScheme.error),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              DatePicker(
                label: AppLocalizations.of(context).translate("cards.availability.begin"),
                minDate: DateTime.now(),
                maxDate: DateTime(2100),
                onChanged: onStartChanged,
                selectedDate: availability.startDate,
              ),
              DatePicker(
                label: AppLocalizations.of(context).translate("cards.availability.end"),
                minDate: availability.startDate,
                maxDate: DateTime(2100),
                onChanged: onEndChanged,
                selectedDate: availability.endDate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
