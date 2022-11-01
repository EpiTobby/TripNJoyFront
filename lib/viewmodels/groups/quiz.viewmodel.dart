import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel(this.httpService);

  final HttpService httpService;

  List<SurveyModel> quiz = [];

  Future<void> getQuizByGroup() async {}

  Future<void> getQuizByUser() async {}
}
