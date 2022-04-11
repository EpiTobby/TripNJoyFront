import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/auth/auth.service.dart';

class ProfileService extends StateNotifier<List<ProfileModel>?> {
  ProfileService(this.httpService, this.authService): super([]) {
    _init();
  }

  final AuthService authService;
  final HttpService httpService;

  void _init() async {
    getUserProfiles();
  }

  Future<void> createProfile(ProfileCreationRequest profileCreationRequest) async {
    int? id = httpService.getUserIdFromToken(authService.token!);
    await httpService.createProfile(id!, profileCreationRequest);
    await getUserProfiles();
  }

  Future<void> getUserProfiles() async {
    var id = httpService.getUserIdFromToken(authService.token!);
    List<ProfileModel>? userProfiles = await httpService.getUserProfiles(id!);
    state = userProfiles ?? [];
  }

  Future<void> updateProfile(int profileId, ProfileUpdateRequest profileUpdateRequest) async {
    int? id = httpService.getUserIdFromToken(authService.token!);
    await httpService.updateProfile(id!, profileId, profileUpdateRequest);
    await getUserProfiles();
  }

  Future<void> deleteProfile(int profileId) async {
    int? id = httpService.getUserIdFromToken(authService.token!);

    await httpService.deleteProfile(id!, profileId);
    await getUserProfiles();
  }
}