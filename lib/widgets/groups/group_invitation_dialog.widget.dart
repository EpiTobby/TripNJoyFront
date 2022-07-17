import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/qr_code.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class GroupInvitationDialog extends HookConsumerWidget {
  const GroupInvitationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupId = ref.watch(qrCodeProvider);
    final qrCodeViewModel = ref.watch(qrCodeProvider.notifier);

    final alreadyJoined = useState(false);
    useEffect(() {
      if (groupId != null) {
        alreadyJoined.value = qrCodeViewModel.checkGroupAlreadyJoined(groupId);
      }
      return null;
    }, [groupId]);

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalizations.of(context).translate('groups.qr_code.error')),
                      ),
                      PrimaryButton(
                        text: AppLocalizations.of(context).translate('groups.qr_code.scan_again'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                  : alreadyJoined.value
                      ? [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context).translate('groups.qr_code.already_joined'),
                            ),
                          ),
                          PrimaryButton(
                            text: AppLocalizations.of(context).translate('groups.qr_code.scan_another'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ]
                      : [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(groupId.toString()),
                          ),
                          PrimaryButton(
                            text: AppLocalizations.of(context).translate('groups.qr_code.join'),
                            onPressed: () {
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
