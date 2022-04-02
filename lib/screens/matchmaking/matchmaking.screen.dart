import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({Key? key}) : super(key: key);

  @override
  _MatchmakingPageState createState() => _MatchmakingPageState();
}

class _MatchmakingPageState extends State<MatchmakingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StandardCard(
        title: "Création du profil voyage",
        subtitle: "Cliquer pour démarrer la création du profil voyage",
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        child: Center(
          child: PrimaryButton(text: "Démarrer", onPressed: () {}),
        ),
      ),
    );
  }
}
