import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

import '../../common/button.widget.dart';
import '../../common/checkbox.widget.dart';

class MultipleChoiceCard extends HookConsumerWidget {
  const MultipleChoiceCard(
      {Key? key,
      required this.name,
      this.title,
      this.subtitle,
      required this.color,
      required this.backgroundColor,
      this.shadowColor,
      this.isLoading = false,
      required this.values})
      : super(key: key);

  final String name;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;
  final bool isLoading;
  final List<String> values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offset = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
    final selectedValues = useState<List<String>>([]);
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    final scrollController = useState(ScrollController());
    return SlideTransition(
      position: offset,
      child: StandardCard(
        name: name,
        title: title,
        subtitle: subtitle,
        color: color,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        isLoading: isLoading,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                interactive: false,
                controller: scrollController.value,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  controller: scrollController.value,
                  children: <Widget>[
                    for (final value in values)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: StandardCheckbox(
                          value: value,
                          onTap: () {
                            if (selectedValues.value.contains(value)) {
                              selectedValues.value = selectedValues.value.where((element) => element != value).toList();
                            } else {
                              selectedValues.value = [...selectedValues.value, value];
                            }
                          },
                          checked: selectedValues.value.contains(value),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              text: AppLocalizations.of(context).translate('common.validate'),
              onPressed: () {
                animation.forward().whenComplete(() {
                  matchmakingService.submitMultipleChoiceCard(name, selectedValues.value);
                  selectedValues.value = [];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
