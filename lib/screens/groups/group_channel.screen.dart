import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';

class GroupChannels extends HookConsumerWidget {
  const GroupChannels({
    Key? key,
    required this.channels,
    required this.selectedChannel,
    required this.onPressed,
  }) : super(key: key);

  final List<ChannelModel> channels;
  final ChannelModel? selectedChannel;
  final void Function(ChannelModel) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = useState(false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).translate('groups.channel.title'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              icon:
                  Icon(isEditMode.value ? Icons.check : Icons.edit, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {
                isEditMode.value = !isEditMode.value;
              },
              splashRadius: 16,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final channel in channels)
                Row(
                  children: [
                    if (isEditMode.value)
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                    title: AppLocalizations.of(context).translate("groups.channel.rename.title"),
                                    label: AppLocalizations.of(context).translate("groups.channel.rename.label"),
                                    initialValue: channel.name ?? '',
                                    onConfirm: (value) async {});
                              });
                        },
                        icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary),
                        splashRadius: 16,
                      ),
                    if (isEditMode.value)
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(AppLocalizations.of(context).translate("groups.channel.delete.title")),
                                  content:
                                      Text(AppLocalizations.of(context).translate("groups.channel.delete.content")),
                                  actions: [
                                    TertiaryButton(
                                      text: AppLocalizations.of(context).translate("groups.channel.delete.cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    PrimaryButton(
                                      text: AppLocalizations.of(context).translate("groups.channel.delete.confirm"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.tertiary),
                        splashRadius: 16,
                      ),
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
                        channel.name ?? '',
                        style: TextStyle(
                            color: channel == selectedChannel
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
