import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/qr_code.provider.dart';
import 'package:trip_n_joy_front/widgets/groups/group_invitation_dialog.widget.dart';

class GroupsScanQRCode extends HookConsumerWidget {
  const GroupsScanQRCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrCodeViewModel = ref.watch(qrCodeProvider.notifier);

    final isHandlingQRCode = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.qr_code.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: MobileScannerController(facing: CameraFacing.back),
            onDetect: (barcode, args) {
              if (isHandlingQRCode.value) {
                return;
              }
              isHandlingQRCode.value = true;
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
                isHandlingQRCode.value = false;
              } else {
                final String code = barcode.rawValue!;
                qrCodeViewModel.extractGroupIdFromQRCode(code);
                debugPrint('Barcode found! $code');
                showBarModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const GroupInvitationDialog();
                  },
                ).whenComplete(() {
                  isHandlingQRCode.value = false;
                });
              }
            },
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
