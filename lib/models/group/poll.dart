abstract class Poll {
  final int pollId;
  final String question;
  final List<String> options;

  Poll(this.pollId, this.question, this.options);
}

class SingleChoicePoll extends Poll {
  String? selectedOption;

  SingleChoicePoll(int pollId, String question, List<String> options) : super(pollId, question, options);
}

class MultipleChoicePoll extends Poll {
  final List<String> selectedOptions = [];

  MultipleChoicePoll(int pollId, String question, List<String> options) : super(pollId, question, options);
}
