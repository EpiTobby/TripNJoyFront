import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/groups/poll.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class ChatPoll extends HookConsumerWidget {
  const ChatPoll({
    Key? key,
    required this.pollId,
    this.onDelete,
  }) : super(key: key);

  final int pollId;
  final Function? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollService = ref.watch(pollProvider);
    final userService = ref.watch(userProvider.notifier);

    final poll = useState<SurveyModel?>(null);
    final isSingleChoicePoll = useMemoized(() => poll.value?.multipleChoiceSurvey == false, [poll.value]);
    final singleOption = useState<String?>(null);
    final multipleOptions = useState<List<String>>([]);

    useEffect(() {
      ref.read(pollProvider).getPoll(pollId).then((value) {
        poll.value = value;

        if (poll.value != null) {
          if (poll.value!.multipleChoiceSurvey!) {
            multipleOptions.value = poll.value!.votes!
                .where((element) => element.voter == userService.userId)
                .map((e) => e.answer!.content!)
                .toList();
          } else {
            singleOption.value =
                poll.value!.votes!.firstWhere((element) => element.voter == userService.userId).answer?.content;
          }
        }
      });
      return null;
    }, [pollId, singleOption.value, multipleOptions.value]);

    if (poll.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              poll.value!.question!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: poll.value!.possibleAnswers!
                    .map(
                      (option) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              isSingleChoicePoll
                                  ? Radio(
                                      value: option.content!,
                                      groupValue: singleOption.value,
                                      onChanged: (String? value) {
                                        singleOption.value = value;
                                        pollService.singleChoiceVote(pollId, option.id!.toInt());
                                      },
                                    )
                                  : Checkbox(
                                      value: multipleOptions.value.contains(option.content!),
                                      onChanged: (selected) {
                                        selected!
                                            ? multipleOptions.value = [...multipleOptions.value, option.content!]
                                            : multipleOptions.value =
                                                multipleOptions.value.where((e) => e != option.content!).toList();
                                        pollService.multipleChoiceVote(pollId, option.id!.toInt(), selected);
                                      },
                                    ),
                              Text(
                                option.content!,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onBackground,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ...?poll.value!.votes
                                  ?.where((element) => element.answer!.content == option.content)
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          MinioService.getImageUrl(e.voter?.profilePicture, DEFAULT_URL.AVATAR),
                                        ),
                                        radius: 10,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            if (poll.value!.submitter == userService.userId && onDelete != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SecondaryButton(
                    text: AppLocalizations.of(context).translate('common.delete'),
                    fitContent: true,
                    onPressed: () async {
                      await pollService.deletePoll(pollId);
                      onDelete!();
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
