import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/budget_receipt_expenses.widget.dart';

class GroupScanReceipt extends HookConsumerWidget {
  const GroupScanReceipt({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minioService = ref.watch(minioProvider);

    final image = useState('');
    final loading = useState(false);
    final handleExpense = useState(false);

    final articles = useState<Map<String, int>>({});
    final total = useState(10);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('groups.scan.title'),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: handleExpense.value
          ? BudgetReceiptExpenses(groupId: groupId)
          : Container(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: loading.value
                    ? [const CircularProgressIndicator()]
                    : [
                        Column(children: [
                          SizedBox(
                            height: 300,
                            width: 300,
                            child: image.value.isEmpty
                                ? Container(
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                    ),
                                  )
                                : Image.network(MinioService.getImageUrl(image.value, DEFAULT_URL.IMAGE)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryButton(
                                text: 'Camera',
                                onPressed: () async {
                                  final imageURL = await minioService.uploadImage(gallery: false);

                                  if (imageURL != null) {
                                    image.value = imageURL;
                                  }
                                },
                                fitContent: true,
                              ),
                              PrimaryButton(
                                text: 'Gallery',
                                onPressed: () async {
                                  final imageURL = await minioService.uploadImage();

                                  if (imageURL != null) {
                                    image.value = imageURL;
                                  }
                                },
                                fitContent: true,
                              )
                            ],
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            AppLocalizations.of(context).translate('groups.scan.description'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        if (image.value.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: PrimaryButton(
                                text: AppLocalizations.of(context).translate('groups.scan.title'),
                                onPressed: () async {
                                  loading.value = true;
                                  // send to backend with budget wiew model

                                  await Future.delayed(const Duration(seconds: 2));

                                  loading.value = false;
                                  handleExpense.value = true;
                                }),
                          )
                      ],
              ),
            ),
    );
  }
}
