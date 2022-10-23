import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/providers/groups/poll.provider.dart';

class ChatPoll extends HookConsumerWidget {
  const ChatPoll({
    Key? key,
    required this.pollId,
  }) : super(key: key);

  final int pollId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poll = useState<Poll?>(null);
    final isSingleChoicePoll = useMemoized(() => poll.value is SingleChoicePoll, [poll.value]);
    final singleOption = useState<String?>(null);
    final multipleOptions = useState<List<String>>([]);
    useEffect(() {
      ref.read(pollProvider).getPoll(pollId).then((value) => poll.value = value);
      return null;
    }, [pollId]);

    if (poll.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              poll.value!.question,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: poll.value!.options
                    .map(
                      (option) => Row(
                        children: [
                          isSingleChoicePoll
                              ? Radio(
                                  value: option,
                                  groupValue: singleOption.value,
                                  onChanged: (String? value) => singleOption.value = value,
                                )
                              : Checkbox(
                                  value: multipleOptions.value.contains(option),
                                  onChanged: (selected) => selected!
                                      ? multipleOptions.value.add(option)
                                      : multipleOptions.value.remove(option),
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
        ),
      ),
    );
  }
}
