import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/qr_code.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';
import 'package:share_extend/share_extend.dart';

class QRCodeDialog extends HookConsumerWidget {
  const QRCodeDialog({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: get QrCode from provider
    final qrCodeViewModel = ref.watch(qrCodeProvider.notifier);
    const qrCodeUrl = "https://upload.wikimedia.org/wikipedia/commons/7/78/Qrcode_wikipedia_fr_v2clean.png";
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Ink.image(
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                    image: const NetworkImage(qrCodeUrl),
                  ),
                ),
                LayoutItem(
                  child: LayoutItemValue(
                    value: AppLocalizations.of(context).translate("groups.qr_code.share"),
                    icon: Icons.share,
                    onPressed: () {
                      // TODO: share qr code
                      ShareExtend.share(qrCodeUrl, "text");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
