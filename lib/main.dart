import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trip_n_joy_front/constants/themes/dark.theme.dart';
import 'package:trip_n_joy_front/constants/themes/light.theme.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/providers/settings/settings.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/screens/auth/auth.screen.dart';
import 'package:trip_n_joy_front/screens/auth/verification.screen.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/services/notification/push_notification.service.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar.widget.dart';
import 'package:trip_n_joy_front/widgets/notifications/firebase_provider.widget.dart';

import 'app_localizations.dart';
import 'constants/navbar/navbar.enum.dart';
import 'screens/groups/groups.screen.dart';
import 'screens/matchmaking/matchmaking.screen.dart';
import 'screens/notification/notification.screen.dart';
import 'screens/settings/settings.screen.dart';

void main() async {
  if (!Platform.isIOS && !Platform.isMacOS) {
    // await initFirebase();
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize();
  }

  runApp(const ProviderScope(child: OverlaySupport.global(child: MyApp())));
}

Future initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();
}

Future initNotifications() async {
  PushNotificationService(FirebaseMessaging.instance);
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsViewModel = ref.watch(settingsProvider);
    return FirebaseProvider(
      child: MaterialApp(
        title: 'TripNJoy',
        theme: settingsViewModel.isDarkMode ? darkTheme : lightTheme,
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
        debugShowCheckedModeBanner: false,
      ),
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
      Future.microtask(() {
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
      });

      return null;
    }, [authViewModel, userViewModel]);

    final user = ref.watch(userProvider);
    final selectedPage = ref.watch(navbarStateProvider) as NavbarPage;
    return user.when(
      data: (data) => Scaffold(
        appBar: selectedPage != NavbarPage.MATCHMAKING && selectedPage != NavbarPage.GROUPS
            ? AppBar(
                title: Text(
                  AppLocalizations.of(context).translate("${selectedPage.name.toLowerCase()}.title"),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.onBackground,
                shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              )
            : null,
        extendBody: true,
        backgroundColor: Theme.of(context).colorScheme.background,
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
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
