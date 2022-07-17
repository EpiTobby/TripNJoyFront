import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class GroupsScanQRCode extends StatefulHookConsumerWidget {
  const GroupsScanQRCode({Key? key}) : super(key: key);

  @override
  _GroupsScanQRCodeState createState() => _GroupsScanQRCodeState();
}

class _GroupsScanQRCodeState extends ConsumerState<GroupsScanQRCode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('groups.invitations')),
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        ),
        body:  MobileScanner(
            allowDuplicates: false,
            controller: MobileScannerController(facing: CameraFacing.back),
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            })
    );
  }
}