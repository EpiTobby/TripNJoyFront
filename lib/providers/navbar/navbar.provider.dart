import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';

final navbarStateProvider = StateNotifierProvider((ref) {
  return NavbarState();
});

class NavbarState extends StateNotifier<NavbarPage> {
  NavbarState() : super(NavbarPage.MATCHMAKING);

  void navigate(NavbarPage page) => state = page;
}
