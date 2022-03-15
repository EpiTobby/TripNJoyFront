import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required String this.text,
    bool this.isLoading = false,
    required Function this.onPressed,
    bool this.isDisabled = false,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function onPressed;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.secondary,
                textStyle: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(180, 48)),
            onPressed: isDisabled ? null : () => onPressed(),
            child: isLoading
                ? SizedBox(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onSecondary,
                      strokeWidth: 3,
                    ),
                    height: 20,
                    width: 20,
                  )
                : Text(text)));
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required String this.text,
    bool this.isLoading = false,
    required Function this.onPressed,
    bool this.isDisabled = false,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function onPressed;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: isDisabled
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.secondary,
                    width: 2),
                textStyle: TextStyle(
                    fontSize: 16,
                    color: isDisabled
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.secondary),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(180, 48)),
            onPressed: isDisabled ? null : () => onPressed(),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(text,
                    style: TextStyle(
                        color: isDisabled
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondary))));
  }
}

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    Key? key,
    required String this.text,
    bool this.isLoading = false,
    required Function this.onPressed,
    bool this.isDisabled = false,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function onPressed;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: isDisabled ? null : () => onPressed(),
        child: Text(text,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      ),
    );
  }
}
