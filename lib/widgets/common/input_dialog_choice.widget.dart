import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';

import 'button.widget.dart';

class InputDialogChoice extends StatefulHookWidget {
  const InputDialogChoice({
    Key? key,
    this.title,
    this.description,
    required this.cancelChoice,
    required this.confirmChoice,
    required this.onConfirm,
    this.delete = true,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String cancelChoice;
  final String confirmChoice;
  final Function onConfirm;
  final bool delete;

  @override
  State<InputDialogChoice> createState() => _InputDialogChoiceState();
}

class _InputDialogChoiceState extends State<InputDialogChoice> {
  void pressButton(ValueNotifier<AsyncValue<void>> status, bool value, BuildContext ctx) async {
    status.value = const AsyncLoading();
    try {
      await widget.onConfirm(value);
      status.value = const AsyncData(null);
      Navigator.of(ctx).pop();
    } on HttpException catch (e) {
      showErrorSnackBar(ctx, e.message);
      status.value = AsyncError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = useState<AsyncValue<void>>(const AsyncValue.data(null));
    return Material(
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              if (widget.description != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.description!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryButton(
                  text: widget.confirmChoice,
                  isLoading: status.value.isLoading,
                  onPressed: () async {
                    pressButton(status, true, context);
                  },
                  color: widget.delete ? Theme.of(context).colorScheme.error : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
