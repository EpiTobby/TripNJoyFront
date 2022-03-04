import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar.icons.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key, required this.selectedIndex, required this.onPressed})
      : super(key: key);

  final int selectedIndex;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.matchmaking,
              color: GetNavbarIconColor(context, selectedIndex, 0),
            ),
            onPressed: () {
              onPressed(0);
            },
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.group,
              color: GetNavbarIconColor(context, selectedIndex, 1),
            ),
            onPressed: () {
              onPressed(1);
            },
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.notification,
              color: GetNavbarIconColor(context, selectedIndex, 2),
            ),
            onPressed: () {
              onPressed(2);
            },
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.settings,
              color: GetNavbarIconColor(context, selectedIndex, 3),
            ),
            onPressed: () {
              onPressed(3);
            },
          ),
        ],
      ),
    );
  }

  Color GetNavbarIconColor(BuildContext context, int selectedIndex, int index) {
    return selectedIndex == index
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primaryContainer;
  }
}
