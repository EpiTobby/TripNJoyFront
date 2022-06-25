import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

class InputField extends HookWidget {
  const InputField({
    Key? key,
    this.label,
    this.onChanged,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.icon,
    this.isPassword = false,
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
  final bool isError;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool multiline;
  final Future<void> Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    final backgroundColor = useState(Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1));
    final focusNode = useFocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        backgroundColor.value = Theme.of(context).colorScheme.secondary.withOpacity(0.1);
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
              fillColor: isError ? Theme.of(context).colorScheme.error.withOpacity(0.1) : backgroundColor.value,
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
          )
        ],
      ),
    );
  }
}
