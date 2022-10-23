import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';

class AddPoll extends HookConsumerWidget {
  const AddPoll({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollQuestionController = useTextEditingController();
    final multipleChoicePoll = useState<bool>(false);
    final options = useState<List<PollOption>>([PollOption(UniqueKey(), "")]);
    void addOption() => options.value = [...options.value, PollOption(UniqueKey(), "")];
    void onChangeOption(UniqueKey id, String value) {
      options.value = options.value.map((e) => e.id == id ? PollOption(e.id, value) : e).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.chat.poll.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            ),
            splashRadius: 16,
            onPressed: () {
              // TODO: create poll
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
                  Text(AppLocalizations.of(context).translate("groups.chat.poll.multipleChoice")),
                ],
              ),
              ...options.value
                  .map((option) => InputField(
                        onChanged: (String value) => onChangeOption(option.id, value),
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
