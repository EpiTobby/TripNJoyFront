import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class RecommendationViewModel extends ChangeNotifier {
  RecommendationViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  void _init() async {}

  Future<List<RecommendationModel>?> getRecommendations(int submitterId) async {
    return await httpService.getRecommendations(submitterId);
  }

  Future<RecommendationModel?> submitRecommendation(SubmitRecommendationRequest submitRecommendationRequest) async {
    return await httpService.submitRecommendation(submitRecommendationRequest);
  }

  Future<void> deleteRecommendation(int recommendationId) async {
    await httpService.deleteRecommendation(recommendationId);
  }
}
