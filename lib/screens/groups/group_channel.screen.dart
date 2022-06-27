import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/providers/groups/channel.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_choice.widget.dart';

class GroupChannels extends HookConsumerWidget {
  const GroupChannels({
    Key? key,
    required this.groupId,
    required this.channels,
    required this.selectedChannel,
    required this.onPressed,
  }) : super(key: key);

  final int groupId;
  final List<ChannelModel> channels;
  final ChannelModel? selectedChannel;
  final void Function(ChannelModel) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = useState(false);
    final channelViewModel = ref.watch(channelProvider.notifier);
    final group = ref.watch(groupProvider.notifier).groups.firstWhere((g) => g.id == groupId);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).translate('groups.channel.title'),
        ),
        actions: [
          if (isEditMode.value)
            IconButton(
              icon: const Icon(Icons.add),
              splashRadius: 16,
              onPressed: () {
                showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                          title: AppLocalizations.of(context).translate("groups.channel.add.title"),
                          label: AppLocalizations.of(context).translate("groups.channel.add.label"),
                          initialValue: '',
                          onConfirm: (value) async {
                            await channelViewModel.createChannel(groupId, CreateChannelRequest(name: value));
                          });
                    });
              },
            ),
          if (group.state != GroupModelState.archived)
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: IconButton(
                icon: Icon(isEditMode.value ? Icons.check : Icons.edit,
                    color: Theme.of(context).colorScheme.onBackground),
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
                          showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                    title: AppLocalizations.of(context).translate("groups.channel.rename.title"),
                                    label: AppLocalizations.of(context).translate("groups.channel.rename.label"),
                                    initialValue: channel.name ?? '',
                                    onConfirm: (value) async {
                                      await channelViewModel.updateChannel(
                                          groupId, channel.id!, UpdateChannelRequest(name: value));
                                    });
                              });
                        },
                        icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary),
                        splashRadius: 16,
                      ),
                    if (isEditMode.value && channels.length > 1)
                      IconButton(
                        onPressed: channels.length > 1
                            ? () {
                                showBarModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return InputDialogChoice(
                                      title: AppLocalizations.of(context).translate("groups.channel.delete.title"),
                                      description:
                                          AppLocalizations.of(context).translate("groups.channel.delete.content"),
                                      cancelChoice:
                                          AppLocalizations.of(context).translate("groups.channel.delete.cancel"),
                                      confirmChoice:
                                          AppLocalizations.of(context).translate("groups.channel.delete.confirm"),
                                      onConfirm: (value) async {
                                        if (value) {
                                          await channelViewModel.deleteChannel(groupId, channel.id!);
                                        }
                                      },
                                    );
                                  },
                                );
                              }
                            : null,
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
