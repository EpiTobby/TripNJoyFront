import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/colors.style.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar,widget.dart';

import 'widgets/groups/groups.widget.dart';
import 'widgets/matchmaking/matchmaking.widget.dart';
import 'widgets/notification/notification.widget.dart';
import 'widgets/settings/settings.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(
                background: CColors.background,
                primary: CColors.primary,
                secondary: CColors.secondary,
                tertiary: CColors.tertiary,
                primaryContainer: CColors.variant),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  void setPageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  final pages = [
    const MatchmakingPage(),
    const GroupsPage(),
    const NotificationPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      extendBody: true,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: pages[pageIndex],
      ),
      bottomNavigationBar:
          Navbar(selectedIndex: pageIndex, onPressed: setPageIndex),
    );
  }
}
