import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/user/recommendation.provider.dart';
import 'package:trip_n_joy_front/providers/user/report.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_report.widget.dart';

class UserDialog extends HookConsumerWidget {
  const UserDialog({Key? key, required this.user}) : super(key: key);

  final MemberModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportViewModel = ref.watch(reportProvider.notifier);
    final recommendationViewModel = ref.watch(recommendationProvider.notifier);
    final currentUser = ref.watch(userProvider.notifier).userId;

    return Material(
      child: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(MinioService.getImageUrl(user.profilePicture, DEFAULT_URL.AVATAR)),
                  radius: 48,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(user.firstname! + ' ' + user.lastname!,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          user.email!,
                          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          user.phoneNumber ?? AppLocalizations.of(context).translate('user.noPhoneNumber'),
                          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          user.gender.toString().split('.')[1],
                          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          user.city != null ? user.city!.name! : AppLocalizations.of(context).translate('user.noCity'),
                          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  if (currentUser != user.id)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButton(
                          text: AppLocalizations.of(context).translate('groups.settings.recommend'),
                          onPressed: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                  title: AppLocalizations.of(context).translate('groups.settings.recommendUser'),
                                  label: AppLocalizations.of(context).translate('groups.settings.recommendation'),
                                  initialValue: '',
                                  multiline: true,
                                  textCapitalization: TextCapitalization.none,
                                  onConfirm: (value) async {
                                    await recommendationViewModel.submitRecommendation(
                                        SubmitRecommendationRequest(reviewedUserId: user.id, comment: value));
                                  },
                                );
                              },
                            );
                          },
                        ),
                        PrimaryButton(
                          text: AppLocalizations.of(context).translate('groups.settings.report'),
                          onPressed: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogReport(
                                  onConfirm: (value, reason) async {
                                    await reportViewModel.submitReport(
                                        SubmitReportRequest(reportedUserId: user.id, reason: reason, details: value));
                                  },
                                );
                              },
                            );
                          },
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
