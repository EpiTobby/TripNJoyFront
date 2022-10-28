import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/poll.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';

class AddQuiz extends HookConsumerWidget {
  const AddQuiz({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatService = ref.watch(chatProvider);

    final quizzQuestionController = useTextEditingController();
    final multipleChoiceQuizz = useState<bool>(false);
    final options = useState<List<PollOption>>([PollOption(UniqueKey(), "")]);
    void addOption() => options.value = [...options.value, PollOption(UniqueKey(), "")];

    void onChangeOption(UniqueKey id, String value) {
      options.value = options.value.map((e) => e.id == id ? PollOption(e.id, value) : e).toList();
    }

    void removeOption(UniqueKey id) {
      options.value = options.value.where((e) => e.id != id).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.chat.poll.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          if (options.value.length > 1 && quizzQuestionController.value.text.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.primary,
              ),
              splashRadius: 16,
              onPressed: () async {
                await ref.read(pollProvider).addPoll(
                  null,
                  PostSurveyRequest(
                    userId: ref.read(userProvider).value?.id,
                    quizz: true,
                    type: PostSurveyRequestType$.survey,
                    content: quizzQuestionController.value.text,
                    isMultipleChoiceSurvey: multipleChoiceQuizz.value,
                    possibleAnswers: options.value.map((e) => PossibleAnswerRequest(content: e.option)).toList(),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InputField(
                label: AppLocalizations.of(context).translate("groups.chat.poll.question"),
                controller: quizzQuestionController,
                icon: const Icon(Icons.question_mark_outlined),
              ),
              Row(
                children: [
                  Checkbox(
                      value: multipleChoiceQuizz.value, onChanged: (value) => multipleChoiceQuizz.value = value ?? false),
                  Text(
                    AppLocalizations.of(context).translate("groups.chat.poll.multipleChoice"),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              ...options.value
                  .map((option) => Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: InputField(
                      onChanged: (String value) => onChangeOption(option.id, value),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () => removeOption(option.id),
                  ),
                ],
              ))
                  .toList(),
              PrimaryButton(
                text: '+',
                fitContent: true,
                onPressed: addOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
