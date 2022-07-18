import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/input/dropdown.widget.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';

import '../button.widget.dart';
import '../input/input.widget.dart';

class InputDialogReport extends StatefulHookWidget {
  const InputDialogReport({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  final Function onConfirm;

  @override
  State<InputDialogReport> createState() => _InputDialogReportState();
}

class _InputDialogReportState extends State<InputDialogReport> {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');
    final status = useState<AsyncValue<void>>(const AsyncValue.data(null));
    final reason = useState(SubmitReportRequestReason.innapropriateBehavior);
    final reasons =
        SubmitReportRequestReason.values.map((e) => e.name).where((e) => e != "swaggerGeneratedUnknown").toList();

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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate('groups.settings.reportUser'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Dropdown(
                  label: AppLocalizations.of(context).translate('groups.settings.reportReason.title'),
                  selectedValue: reason.value.name,
                  listValue: reasons,
                  listLabel: reasons
                      .map((e) => AppLocalizations.of(context).translate('groups.settings.reportReason.$e'))
                      .toList(),
                  onChanged: (value) {
                    reason.value = SubmitReportRequestReason.values.firstWhere((e) => e.name == value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputField(
                    label: AppLocalizations.of(context).translate('groups.settings.reportReason.details'),
                    controller: controller,
                    onChanged: (newValue) => {},
                    isError: status.value.isError,
                    multiline: true,
                    textCapitalization: TextCapitalization.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TertiaryButton(
                        text: AppLocalizations.of(context).translate("common.cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      PrimaryButton(
                        text: status.value.isError
                            ? AppLocalizations.of(context).translate("common.tryAgain")
                            : AppLocalizations.of(context).translate("common.submit"),
                        isLoading: status.value.isLoading,
                        onPressed: () async {
                          status.value = const AsyncLoading();
                          try {
                            await widget.onConfirm(controller.text, reason.value);
                            status.value = const AsyncData(null);
                            Navigator.of(context).pop();
                          } on HttpException catch (e) {
                            showErrorSnackBar(context, e.message);
                            status.value = AsyncError(e);
                          }
                        },
                        fitContent: true,
                      ),
                    ],
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
