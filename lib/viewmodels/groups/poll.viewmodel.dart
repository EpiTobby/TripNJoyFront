import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class PollViewModel extends ChangeNotifier {
  PollViewModel(this.httpService);

  final HttpService httpService;

  Future<Poll?> getPoll(int pollId) async {
    return await httpService.getPoll(pollId);
  }

  Future<void> toggleVote(int pollId, String option, bool voted) async {
    await httpService.toggleVote(pollId, option, voted);
  }

  Future<SurveyModel?> addPoll(int channelId, PostSurveyRequest poll) async {
    return await httpService.addPoll(channelId, poll);
  }
}
