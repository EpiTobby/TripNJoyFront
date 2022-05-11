import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_n_joy_front/models/matchmaking/availability.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/matchmaking.viewmodel.dart';
import 'package:trip_n_joy_front/viewmodels/matchmaking/profile.viewmodel.dart';

class MockHttpService extends Mock implements HttpService {}

class MockAuthViewModel extends Mock implements AuthViewModel {}

class MockProfileViewModel extends Mock implements ProfileViewModel {}

void main() {
  MockHttpService mockHttpService = MockHttpService();
  MockAuthViewModel mockAuthViewModel = MockAuthViewModel();
  MockProfileViewModel mockProfileViewModel = MockProfileViewModel();
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
  MatchmakingViewModel matchmakingViewModel =
      MatchmakingViewModel(mockHttpService, mockAuthViewModel, mockProfileViewModel, flutterSecureStorage);

  setUp(() {
    mockHttpService = MockHttpService();
    mockAuthViewModel = MockAuthViewModel();
    mockProfileViewModel = MockProfileViewModel();
    matchmakingViewModel =
        MatchmakingViewModel(mockHttpService, mockAuthViewModel, mockProfileViewModel, flutterSecureStorage);
  });

  test('should init cards state to empty array when init matchmaking ViewModel', () {
    expect(matchmakingViewModel.cards, isEmpty);
  });

  test('should init index state to 0 when init matchmaking ViewModel', () {
    expect(matchmakingViewModel.index, 0);
  });

  test('should init profileCreationRequest state to empty map when init matchmaking ViewModel', () {
    expect(matchmakingViewModel.profileCreationRequest, isEmpty);
  });

  test('should add cards to state when startProfileCreation', () {
    matchmakingViewModel.startProfileCreation();
    expect(matchmakingViewModel.cards, isNotEmpty);
  });

  test('should increment index by 1 when nextCard', () {
    matchmakingViewModel.nextCard();
    expect(matchmakingViewModel.index, 1);
  });

  test('should decrement index by 1 when previousCard', () {
    matchmakingViewModel.previousCard();
    expect(matchmakingViewModel.index, -1);
  });

  test('should not decrement index by 1 when previousCard given index is -1', () {
    matchmakingViewModel.previousCard();
    matchmakingViewModel.previousCard();
    expect(matchmakingViewModel.index, -1);
  });

  test('should populate profileCreationRequest when submitCard', () {
    const name = 'name';
    const value = 'VALUE';
    matchmakingViewModel.submitCard(name, value);
    expect(matchmakingViewModel.profileCreationRequest[name], value);
  });

  test('should populate profileCreationRequest when submitMultipleChoiceCard', () {
    const name = 'name';
    const values = ['VALUE1', 'VALUE2'];
    matchmakingViewModel.submitMultipleChoiceCard(name, values);
    expect(matchmakingViewModel.profileCreationRequest[name], values);
  });

  test('should populate profileCreationRequest when submitRangeCard', () {
    const name = 'name';
    const start = 2.0;
    const end = 3.0;
    const values = RangeValues(start, end);
    matchmakingViewModel.submitRangeValue(name, values);
    expect(matchmakingViewModel.profileCreationRequest[name]['minValue'], start);
    expect(matchmakingViewModel.profileCreationRequest[name]['maxValue'], end);
  });

  test('should populate profileCreationRequest when submitAvailability', () {
    const name = 'name';
    final start1 = DateTime(2020, 1, 1);
    final end1 = DateTime(2020, 1, 2);
    final start2 = DateTime(2020, 1, 4);
    final end2 = DateTime(2020, 1, 5);
    final values = [Availability(startDate: start1, endDate: end1), Availability(startDate: start2, endDate: end2)];
    matchmakingViewModel.submitAvailability(name, values);
    expect(matchmakingViewModel.profileCreationRequest[name][0]['startDate'], start1.toIso8601String());
    expect(matchmakingViewModel.profileCreationRequest[name][0]['endDate'], end1.toIso8601String());
    expect(matchmakingViewModel.profileCreationRequest[name][1]['startDate'], start2.toIso8601String());
    expect(matchmakingViewModel.profileCreationRequest[name][1]['endDate'], end2.toIso8601String());
  });
}
