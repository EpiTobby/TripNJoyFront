import 'package:flutter/material.dart';

class InputWrap extends StatelessWidget {
  const InputWrap(
      {Key? key, required this.label, this.icon, required this.child})
      : super(key: key);
  final String label;
  final Icon? icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 10),
                    child: Row(
                      children: [
                        if (icon != null)
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(icon!.icon,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer)),
                        Expanded(child: child),
                      ],
                    )))
          ],
        ));
  }
}
