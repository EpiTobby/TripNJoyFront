import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth_step.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/screens/auth/auth.screen.dart';
import 'package:trip_n_joy_front/screens/auth/verification.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar.widget.dart';

import 'app_localizations.dart';
import 'constants/auth/auth_step.enum.dart';
import 'constants/navbar/navbar.enum.dart';
import 'screens/groups/groups.screen.dart';
import 'screens/matchmaking/matchmaking.screen.dart';
import 'screens/notification/notification.screen.dart';
import 'screens/settings/settings.screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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

        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
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
    final authService = ref.watch(authProvider);
    final userService = ref.watch(userProvider.notifier);
    useEffect(() {
      authService.updateTokenFromStorage().then((value) {
        if (value != null) {
          userService.loadUser(value);
        }
      });
      return null;
    }, []);

    final step = ref.watch(authStepProvider) as AuthStep;

    if (!authService.isAuthenticated) {
      return Auth();
    }

    useEffect(() {
      if (authService.isAuthenticated) {
        userService.loadUser(authService.token!);
      }
      if (step == AuthStep.SIGNUP) {
        SchedulerBinding.instance?.endOfFrame.then((_) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AccountVerification()));
        });
      }
      return null;
    }, [authService]);

    final user = ref.watch(userProvider);
    final selectedPage = ref.watch(navbarStateProvider) as NavbarPage;
    return user.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              extendBody: true,
              body: Center(
                child: getPageWidget(selectedPage),
              ),
              bottomNavigationBar: Navbar(),
            ),
        error: (error, r) {
          logger.e(error, r);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Text(
                      AppLocalizations.of(context)
                          .translate('errors.unexpected'),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                text:
                    AppLocalizations.of(context).translate('common.reconnect'),
                onPressed: () {
                  authService.logout();
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  getPageWidget(NavbarPage selectedPage) {
    switch (selectedPage) {
      case NavbarPage.MATCHMAKING:
        return MatchmakingPage();
      case NavbarPage.GROUPS:
        return GroupsPage();
      case NavbarPage.NOTIFICATIONS:
        return NotificationPage();
      case NavbarPage.SETTINGS:
        return SettingsPage();
      default:
        return MatchmakingPage();
    }
  }
}
