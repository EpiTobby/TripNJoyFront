import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

import '../auth/auth.viewmodel.dart';

class ProfileViewModel extends StateNotifier<List<ProfileModel>?> {
  ProfileViewModel(this.httpService, this.authViewModel) : super([]) {
    _init();
  }

  final AuthViewModel authViewModel;
  final HttpService httpService;

  void _init() async {
    getUserProfiles();
  }

  Future<void> createProfile(ProfileCreationRequest profileCreationRequest) async {
    int? id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.createProfile(id!, profileCreationRequest);
    await getUserProfiles();
  }

  Future<void> getUserProfiles() async {
    var id = httpService.getUserIdFromToken(authViewModel.token!);
    List<ProfileModel>? userProfiles = await httpService.getUserProfiles(id!);
    state = userProfiles ?? [];
  }

  Future<void> updateProfile(int profileId, ProfileUpdateRequest profileUpdateRequest) async {
    int? id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.updateProfile(id!, profileId, profileUpdateRequest);
    await getUserProfiles();
  }

  Future<void> deleteProfile(int profileId) async {
    int? id = httpService.getUserIdFromToken(authViewModel.token!);

    await httpService.deleteProfile(id!, profileId);
    await getUserProfiles();
  }
}
