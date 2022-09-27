import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';

class InputDialogPrice extends StatefulHookWidget {
  const InputDialogPrice({
    Key? key,
    required this.onConfirm,
    required this.label,
    this.shouldHaveInputName = true,
  }) : super(key: key);

  final Function onConfirm;
  final String label;
  final bool shouldHaveInputName;

  @override
  State<InputDialogPrice> createState() => _InputDialogPriceState();
}

class _InputDialogPriceState extends State<InputDialogPrice> {
  @override
  Widget build(BuildContext context) {
    final name = useState("");
    final price = useState(0.0);
    final status = useState<AsyncValue<void>>(const AsyncValue.data(null));

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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                  child: ListBody(
                children: [
                  if (widget.shouldHaveInputName)
                    InputField(
                      label: AppLocalizations.of(context).translate("groups.scan.addArticle.name"),
                      onChanged: (newValue) => name.value = newValue,
                      isError: status.value.isError,
                    ),
                  InputField(
                    label: AppLocalizations.of(context).translate("groups.scan.addArticle.price"),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (newValue) => price.value = double.tryParse(newValue) ?? 0,
                    isError: status.value.isError,
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(
                  text: status.value.isError
                      ? AppLocalizations.of(context).translate("common.tryAgain")
                      : AppLocalizations.of(context).translate("common.submit"),
                  isDisabled: name.value.isEmpty,
                  isLoading: status.value.isLoading,
                  onPressed: () async {
                    status.value = const AsyncLoading();
                    try {
                      await widget.onConfirm(name.value, price.value);
                      status.value = const AsyncData(null);
                      Navigator.of(context).pop();
                    } catch (e) {
                      status.value = AsyncError(e);
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
