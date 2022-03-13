import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.hint = "",
      this.keyboardType = TextInputType.text,
      this.icon,
      this.isPassword = false,
      this.isError = false})
      : super(key: key);

  final String label;
  final Function onChanged;
  final String hint;
  final Icon? icon;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isError;

  @override
  Widget build(BuildContext context) {
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
                  label,
                  style: TextStyle(
                    color: isError
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            TextField(
              onChanged: (value) => onChanged(value),
              obscureText: isPassword,
              decoration: InputDecoration(
                prefixIcon: icon,
                prefixIconColor: isError
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.secondary,
                labelText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 2,
                    color: isError
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      width: 2,
                      color: isError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.secondary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            )
          ],
        ));
  }
}
