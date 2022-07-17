import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/qr_code.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_empty.widget.dart';

class GroupInvitationDialog extends HookConsumerWidget {
  const GroupInvitationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupId = ref.watch(qrCodeProvider);
    final qrCodeViewModel = ref.watch(qrCodeProvider.notifier);
    final groupsViewModel = ref.watch(groupProvider);
    final groupInfo = groupsViewModel.groupInfo;

    final alreadyJoined = useState(false);
    useEffect(() {
      if (groupId != null) {
        alreadyJoined.value = qrCodeViewModel.checkGroupAlreadyJoined(groupId);
      }
      return null;
    }, [groupId]);

    useEffect(() {
      if (!alreadyJoined.value) {
        groupsViewModel.getGroupPublicInfoById(groupId!);
      }
      return null;
    }, [alreadyJoined]);

    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: groupId == null
                  ? [
                      LayoutEmpty(
                        message: AppLocalizations.of(context).translate('groups.qr_code.error'),
                        icon: Icons.highlight_remove,
                        variant: Theme.of(context).colorScheme.error.withOpacity(0.8),
                      ),
                    ]
                  : alreadyJoined.value
                      ? [
                          LayoutEmpty(
                            message: AppLocalizations.of(context).translate('groups.qr_code.already_joined'),
                            icon: Icons.highlight_remove,
                            variant: Theme.of(context).colorScheme.error.withOpacity(0.8),
                          )
                        ]
                      : [
                          AsyncValueWidget<GroupModel>(
                            value: groupInfo,
                            data: (data) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 32.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Theme.of(context).colorScheme.surface,
                                      backgroundImage:
                                          NetworkImage(MinioService.getImageUrl(data.picture, DEFAULT_URL.GROUP)),
                                    ),
                                  ),
                                  Text(
                                    data.name ?? '',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Chip(
                                      label: Text(
                                        AppLocalizations.of(context)
                                            .translate("groups.settings.type.${data.state!.name}"),
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: data.state == GroupModelState.closed
                                          ? Theme.of(context).colorScheme.tertiary
                                          : data.state == GroupModelState.open
                                              ? Theme.of(context).colorScheme.secondary
                                              : Theme.of(context).colorScheme.primary,
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    ),
                                  ),
                                  Text(
                                    "${data.members?.length ?? 0} / ${data.maxSize ?? 0}",
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PrimaryButton(
                            text: AppLocalizations.of(context).translate('groups.qr_code.join'),
                            onPressed: () async {
                              await groupsViewModel.joinPrivateGroup(groupId);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
            ),
          ),
        ),
      ),
    );
  }
}
