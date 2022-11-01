import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class PollViewModel extends ChangeNotifier {
  PollViewModel(this.httpService);

  final HttpService httpService;

  Future<SurveyModel?> getPoll(int pollId) async {
    return await httpService.getPoll(pollId);
  }

  Future<void> singleChoiceVote(int pollId, int answerId) async {
    await httpService.singleChoiceVote(pollId, answerId);
  }

  Future<void> multipleChoiceVote(int pollId, int answerId, bool voted) async {
    await httpService.multipleChoiceVote(pollId, answerId, voted);
  }

  Future<SurveyModel?> addPoll(int? channelId, PostSurveyRequest poll) async {
    if (channelId == null) {
      return null;
    }

    return await httpService.addPoll(channelId, poll);
  }

  Future<void> deletePoll(int pollId) async {
    await httpService.deletePoll(pollId);
  }
}
