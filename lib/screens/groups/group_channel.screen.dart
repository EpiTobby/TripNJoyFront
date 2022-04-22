import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class GroupChannels extends HookConsumerWidget {
  const GroupChannels({
    Key? key,
    required this.channels,
    required this.selectedChannel,
    required this.onPressed,
  }) : super(key: key);

  final List<String> channels;
  final String selectedChannel;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(AppLocalizations.of(context).translate('groups.channel.title'))),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      primary: Theme.of(context).colorScheme.secondary,
                      textStyle: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSecondary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
            for (final channel in channels)
              ElevatedButton(
                onPressed: () => onPressed(channel),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    primary: channel == selectedChannel
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.surface,
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: channel == selectedChannel
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onSurface),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                child: Text(
                  channel,
                  style: TextStyle(
                      color: channel == selectedChannel
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.primary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
