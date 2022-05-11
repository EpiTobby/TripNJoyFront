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
    required this.cancelChoice,
    required this.confirmChoice,
    required this.onConfirm,
  }) : super(key: key);

  final String? title;
  final String cancelChoice;
  final String confirmChoice;
  final Function onConfirm;

  @override
  State<InputDialogChoice> createState() => _InputDialogChoiceState();
}

class _InputDialogChoiceState extends State<InputDialogChoice> {
  void pressButton(ValueNotifier<AsyncValue<void>> status, bool value, BuildContext ctx) async {
    status.value = AsyncLoading();
    try {
      await widget.onConfirm(value);
      status.value = AsyncData(null);
      Navigator.of(ctx).pop();
    } on HttpException catch (e) {
      showErrorSnackBar(ctx, e.message);
      status.value = AsyncError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = useState<AsyncValue<void>>(AsyncValue.data(null));
    return AlertDialog(
      title: Center(child: Text(widget.title ?? '', style: TextStyle(color: Theme.of(context).colorScheme.primary))),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TertiaryButton(
                text: widget.cancelChoice,
                isLoading: status.value.isLoading,
                onPressed: () async {
                  pressButton(status, false, context);
                },
              ),
              PrimaryButton(
                text: widget.confirmChoice,
                isLoading: status.value.isLoading,
                onPressed: () async {
                  pressButton(status, true, context);
                },
                fitContent: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
