import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/screens/auth/forgot_password.screen.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class InputField extends HookConsumerWidget {
  const InputField({
    Key? key,
    this.label,
    this.onChanged,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.icon,
    this.isPassword = false,
    this.displayForgotPassword = false,
    this.isError = false,
    this.inputFormatters,
    this.controller,
    this.multiline = false,
    this.onEditingComplete,
  }) : super(key: key);

  final String? label;
  final void Function(String)? onChanged;
  final String hint;
  final Icon? icon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final bool displayForgotPassword;
  final bool isError;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool multiline;
  final Future<void> Function()? onEditingComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = useState(false);
    final backgroundColor = useState(Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1));
    final focusNode = useFocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        backgroundColor.value = Theme.of(context).colorScheme.secondaryContainer;
      } else {
        backgroundColor.value = Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1);
      }
    });
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                label!,
                style: TextStyle(
                  color: isError
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          TextField(
            onChanged: onChanged,
            controller: controller,
            obscureText: isPassword && !isVisible.value,
            keyboardType: multiline ? TextInputType.multiline : keyboardType,
            inputFormatters: inputFormatters,
            textCapitalization: isPassword ? TextCapitalization.none : textCapitalization,
            maxLines: multiline ? 10 : 1,
            focusNode: focusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: icon,
              prefixIconColor: isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.secondary,
              suffixIcon: isPassword
                  ? IconButton(
                      splashRadius: 15,
                      icon: Icon(
                        isVisible.value ? Icons.visibility : Icons.visibility_off,
                        color: isError
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primaryContainer,
                      ),
                      onPressed: () {
                        isVisible.value = !isVisible.value;
                      },
                    )
                  : null,
              hintText: hint,
              filled: true,
              fillColor: isError ? Theme.of(context).colorScheme.errorContainer : backgroundColor.value,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.transparent,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
            onEditingComplete: onEditingComplete,
          ),
          if (isPassword && displayForgotPassword)
            Align(
              alignment: Alignment.topRight,
              child: TertiaryButton(
                  text: AppLocalizations.of(context).translate("auth.forgotPassword"),
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()))),
            ),
        ],
      ),
    );
  }
}
