import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/quiz.provider.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/polls/chat_poll.widget.dart';

class GroupQuiz extends HookConsumerWidget {
  const GroupQuiz({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizViewModel = ref.watch(quizProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('settings.quiz.title'),
        ),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildQuiz(context)
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildQuiz(BuildContext context) {
    final firstQuiz = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz de Yanis n°1 :',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Quel est ma couleur préférée',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ['Rouge', 'Noir', 'Bleu']
                .map(
                  (option) => Row(
                    children: [
                      Radio(
                        value: option,
                        groupValue: 'Bleu',
                        onChanged: (String? value) {},
                      ),
                      Text(
                        option,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );

    final secondQuiz = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz de Yanis n°2 :',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Quel est ma musique préférée ?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ['Gimme Gimme', 'Thriller', 'I\'m blue']
                .map(
                  (option) => Row(
                    children: [
                      Radio(
                        value: option,
                        groupValue: 'Gimme Gimme',
                        onChanged: (String? value) {},
                      ),
                      Text(
                        option,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );

    final thirdQuiz = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz de Tony n°1 :',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Quel est mon plat préféré ?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ['Pizza', 'Pâtes carbonara', 'Lasagnes']
                .map(
                  (option) => Row(
                    children: [
                      Radio(
                        value: option,
                        groupValue: 'Pâtes carbonara',
                        onChanged: (String? value) {},
                      ),
                      Text(
                        option,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );

    return [firstQuiz, secondQuiz, thirdQuiz];
  }
}
