import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/screens/auth/auth.screen.dart';
import 'package:trip_n_joy_front/screens/auth/verification.screen.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/services/notification/push_notification.service.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar.widget.dart';

import 'app_localizations.dart';
import 'constants/navbar/navbar.enum.dart';
import 'screens/groups/groups.screen.dart';
import 'screens/matchmaking/matchmaking.screen.dart';
import 'screens/notification/notification.screen.dart';
import 'screens/settings/settings.screen.dart';

void main() async {
  await initFirebase();
  runApp(const ProviderScope(child: MyApp()));
}

Future initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();
}

Future initNotifications() async {
  final pushNotificationService = PushNotificationService(FirebaseMessaging.instance);
  pushNotificationService.init();
  pushNotificationService.setNotifications();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripNJoy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: CColors.background,
          primary: CColors.primary,
          secondary: CColors.secondary,
          tertiary: CColors.tertiary,
          onBackground: CColors.onBackground,
          onPrimary: CColors.onPrimary,
          onSecondary: CColors.onSecondary,
          onTertiary: CColors.onTertiary,
          primaryContainer: CColors.variant,
          error: CColors.error,
          onError: CColors.onError,
          surface: CColors.surface,
          onSurface: CColors.onSurface,
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(CColors.secondary),
        ),
        sliderTheme: const SliderThemeData(
          thumbColor: CColors.secondary,
          activeTickMarkColor: CColors.secondary,
          activeTrackColor: CColors.secondary,
          showValueIndicator: ShowValueIndicator.always,
          overlayColor: CColors.secondary,
          valueIndicatorColor: CColors.secondary,
        ),
      ),
      supportedLocales: const [
        Locale('fr', 'FR'),
        Locale('en', 'en_US'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const TripNJoy(title: 'TripNJoy'),
    );
  }
}

class TripNJoy extends StatefulHookConsumerWidget {
  const TripNJoy({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<TripNJoy> createState() => _TripNJoyState();
}

class _TripNJoyState extends ConsumerState<TripNJoy> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authProvider);
    final userViewModel = ref.watch(userProvider.notifier);
    useEffect(() {
      authViewModel.updateTokenFromStorage().then((value) {
        if (value != null) {
          userViewModel.loadUser().then((value) {
            if (value == null) authViewModel.logout();
          });
        }
      });
      return () {};
    }, []);

    if (!authViewModel.isAuthenticated) {
      return Auth();
    }

    useEffect(() {
      if (authViewModel.isAuthenticated && mounted) {
        userViewModel.loadUser().then((value) {
          if (value != null && mounted) {
            if (value.confirmed == false) {
              logger.d("user not confirmed");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => AccountVerification(
                    userId: value.id!.toInt(),
                  ),
                ),
              );
            }
          } else {
            logger.d("user not found");
            authViewModel.logout();
          }
        });
      }
      return null;
    }, [authViewModel]);

    final user = ref.watch(userProvider);
    final selectedPage = ref.watch(navbarStateProvider) as NavbarPage;
    return user.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              extendBody: true,
              body: Container(
                child: getPageWidget(selectedPage),
              ),
              bottomNavigationBar: const Navbar(),
              resizeToAvoidBottomInset: false,
            ),
        error: (error, r) {
          logger.e(error, r);
          return const ErrorScreen();
        },
        loading: () => Scaffold(
            body: Center(
                child: Container(
                    color: Theme.of(context).colorScheme.background, child: const CircularProgressIndicator()))));
  }

  getPageWidget(NavbarPage selectedPage) {
    switch (selectedPage) {
      case NavbarPage.MATCHMAKING:
        return const MatchmakingPage();
      case NavbarPage.GROUPS:
        return const GroupsPage();
      case NavbarPage.NOTIFICATIONS:
        return const NotificationPage();
      case NavbarPage.SETTINGS:
        return const SettingsPage();
      default:
        return const MatchmakingPage();
    }
  }
}
