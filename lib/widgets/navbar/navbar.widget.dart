import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.icons.dart';

import '../../constants/navbar/navbar.const.dart';
import '../../constants/navbar/navbar.enum.dart';
import '../../providers/navbar/navbar.provider.dart';

class Navbar extends HookConsumerWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = ref.watch(navbarStateProvider) as NavbarPage;
    final provider = ref.watch(navbarStateProvider.notifier);
    return Container(
      height: NavbarConstant.NAVBAR_HEIGHT,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(NavbarConstant.NAVBAR_RADIUS),
          topRight: Radius.circular(NavbarConstant.NAVBAR_RADIUS),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
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
              color: GetNavbarIconColor(context, selectedPage, NavbarPage.MATCHMAKING),
            ),
            onPressed: () => provider.navigate(NavbarPage.MATCHMAKING),
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.group,
              color: GetNavbarIconColor(context, selectedPage, NavbarPage.GROUPS),
            ),
            onPressed: () => provider.navigate(NavbarPage.GROUPS),
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.notification,
              color: GetNavbarIconColor(context, selectedPage, NavbarPage.NOTIFICATIONS),
            ),
            onPressed: () => provider.navigate(NavbarPage.NOTIFICATIONS),
          ),
          IconButton(
            enableFeedback: false,
            icon: Icon(
              NavbarIcon.settings,
              color: GetNavbarIconColor(context, selectedPage, NavbarPage.SETTINGS),
            ),
            onPressed: () => provider.navigate(NavbarPage.SETTINGS),
          ),
        ],
      ),
    );
  }

  Color GetNavbarIconColor(BuildContext context, NavbarPage selectedPage, NavbarPage page) {
    return selectedPage == page
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primaryContainer;
  }
}
