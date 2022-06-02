import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputField extends StatefulHookWidget {
  const InputField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.icon,
    this.isPassword = false,
    this.isError = false,
    this.inputFormatters,
    this.controller,
    this.multiline = false,
  }) : super(key: key);

  final String label;
  final Function onChanged;
  final String hint;
  final Icon? icon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final bool isError;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool multiline;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            TextField(
              onChanged: (value) => widget.onChanged(value),
              controller: widget.controller,
              obscureText: widget.isPassword && !isVisible.value,
              keyboardType: widget.multiline ? TextInputType.multiline : widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              textCapitalization: widget.isPassword ? TextCapitalization.none : widget.textCapitalization,
              maxLines: widget.multiline ? 10 : 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: widget.icon,
                prefixIconColor:
                    widget.isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.secondary,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          isVisible.value ? Icons.visibility : Icons.visibility_off,
                          color: widget.isError
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primaryContainer,
                        ),
                        onPressed: () {
                          isVisible.value = !isVisible.value;
                        },
                      )
                    : null,
                labelText: widget.hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 2,
                    color: widget.isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      width: 2,
                      color: widget.isError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.secondary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            )
          ],
        ));
  }
}
