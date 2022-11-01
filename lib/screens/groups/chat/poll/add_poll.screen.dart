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

class AddPoll extends HookConsumerWidget {
  const AddPoll({
    Key? key,
    required this.groupId,
    required this.channelId,
  }) : super(key: key);

  final int groupId;
  final int channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatService = ref.watch(chatProvider);

    final pollQuestionController = useTextEditingController();
    final multipleChoicePoll = useState<bool>(false);
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
          if (options.value.length > 1 && pollQuestionController.value.text.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.primary,
              ),
              splashRadius: 16,
              onPressed: () async {
                final survey = await ref.read(pollProvider).addPoll(
                      channelId.toInt(),
                      PostSurveyRequest(
                        userId: ref.read(userProvider).value?.id,
                        quizz: false,
                        type: PostSurveyRequestType$.survey,
                        content: pollQuestionController.value.text,
                        isMultipleChoiceSurvey: multipleChoicePoll.value,
                        possibleAnswers: options.value.map((e) => PossibleAnswerRequest(content: e.option)).toList(),
                      ),
                    );
                chatService.sendMessage(channelId, survey!.id!.toString(), MessageResponseType$.survey);
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
                controller: pollQuestionController,
                icon: const Icon(Icons.question_mark_outlined),
              ),
              Row(
                children: [
                  Checkbox(
                      value: multipleChoicePoll.value, onChanged: (value) => multipleChoicePoll.value = value ?? false),
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
