import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/qr_code.provider.dart';
import 'package:trip_n_joy_front/services/utils/image.util.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
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
    final qrCodeViewModel = ref.watch(qrCodeProvider);
    final qrCodeBase64 = qrCodeViewModel.qrCodeBase64;
    useEffect(() {
      Future.microtask(() => ref.read(qrCodeProvider).getGroupQRCode(groupId));
      return null;
    }, [groupId]);
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AsyncValueWidget<String>(
              value: qrCodeBase64,
              data: (data) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.memory(const Base64Decoder().convert(data)),
                  ),
                  LayoutItem(
                    child: LayoutItemValue(
                      value: AppLocalizations.of(context).translate("groups.qr_code.share"),
                      icon: Icons.share,
                      onPressed: () async {
                        final path = await writeByteToImageFile(const Base64Decoder().convert(data));
                        ShareExtend.share(path, "image");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
