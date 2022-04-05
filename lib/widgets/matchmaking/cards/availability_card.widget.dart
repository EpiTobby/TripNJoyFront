import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/common/date_picker.widget.dart';

import '../../../models/matchmaking/availability.model.dart';
import '../../common/button.widget.dart';

class AvailabilityCard extends HookConsumerWidget {
  const AvailabilityCard({Key? key, this.isLoading = false}) : super(key: key);

  final bool isLoading;
  final name = "availability";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availabilities =
        useState<List<Availability>>([Availability(startDate: DateTime.now(), endDate: DateTime.now())]);
    final scrollController = useState(ScrollController());
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
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
                      onDelete: () {
                        availabilities.value.remove(availability);
                        scrollController.value.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                    ),
                  SizedBox(
                    width: 20,
                    child: PrimaryButton(
                        text: "+",
                        onPressed: () {
                          availabilities.value = availabilities.value
                            ..add(Availability(startDate: DateTime.now(), endDate: DateTime.now()));
                        }),
                  )
                ],
              ),
            ),
          ),
          PrimaryButton(
            text: AppLocalizations.of(context).translate('common.validate'),
            isDisabled: availabilities.value.isEmpty,
            onPressed: () {
              matchmakingService.submitAvailability(name, availabilities.value);
            },
          ),
        ],
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
  final Function? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
    );
  }
}
