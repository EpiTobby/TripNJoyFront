import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/user/recommendation.provider.dart';
import 'package:trip_n_joy_front/providers/user/report.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';

class UserDialog extends HookConsumerWidget {
  const UserDialog({Key? key, required this.user}) : super(key: key);

  final MemberModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportViewModel = ref.watch(reportProvider.notifier);
    final recommendationViewModel = ref.watch(recommendationProvider.notifier);

    return Material(
      child: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicture ?? DEFAULT_AVATAR_URL),
                  radius: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:
                      Text(user.firstname! + ' ' + user.lastname!, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(text: 'Email : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: user.email!),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(text: 'Phone : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    (user.phoneNumber ?? AppLocalizations.of(context).translate('user.noPhoneNumber'))),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(text: 'Gender : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: user.gender.toString().split('.')[1]),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(text: 'City : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: (user.city != null
                                    ? user.city!.name!
                                    : AppLocalizations.of(context).translate('user.noCity'))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                        text: AppLocalizations.of(context).translate('groups.settings.recommend'),
                        onPressed: () {
                          showMaterialModalBottomSheet(
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
                                    });
                              });
                        },
                        fitContent: true),
                    PrimaryButton(
                        text: AppLocalizations.of(context).translate('groups.settings.report'),
                        onPressed: () {
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                    title: AppLocalizations.of(context).translate('groups.settings.reportUser'),
                                    label: AppLocalizations.of(context).translate('groups.settings.reportForm'),
                                    initialValue: '',
                                    multiline: true,
                                    textCapitalization: TextCapitalization.none,
                                    onConfirm: (value) async {
                                      await reportViewModel
                                          .submitReport(SubmitReportRequest(reportedUserId: user.id, reason: value));
                                    });
                              });
                        },
                        fitContent: true,
                        isError: true),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
