import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/notification/push_notification.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class GroupViewModel extends ChangeNotifier {
  GroupViewModel(this.httpService, this.authViewModel, this.pushNotificationService) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;
  final PushNotificationService pushNotificationService;

  List<GroupResponse> groups = [];
  AsyncValue<GroupInfoModel> groupInfo = const AsyncValue.loading();
  HashMap<num, GroupMemberModel> groupMembers = HashMap();
  bool isLoading = false;
  static const String groupTopic = 'chat_';

  final defaultGroupModel = GroupResponse(
    id: 0,
    name: '',
    maxSize: 0,
    members: [],
    ownerId: null,
    state: GroupResponseState.open,
  );

  Map<int, List<String>> memories = {};

  void _init() async {
    isLoading = true;
    await getGroups();
    isLoading = false;
  }

  Future<void> getGroups() async {
    if (authViewModel.token == null) {
      return;
    }

    for (var group in groups) {
      pushNotificationService.unsubscribeToTopic(groupTopic + group.id.toString());
    }

    final id = httpService.getUserIdFromToken(authViewModel.token!);

    final userGroups = await httpService.getGroups(id!);
    groups = userGroups ?? [];

    for (var group in groups) {
      await getGroupMemories(group.id!.toInt());

      for (var memberId in group.members!) {
        if (!groupMembers.containsKey(memberId)) {
          loadGroupMember(group.id!.toInt(), memberId);
        }
      }
    }

    notifyListeners();
    for (var group in groups) {
      pushNotificationService.subscribeToTopic(groupTopic + group.id.toString());
    }
  }

  Future<List<GroupResponse>> getUserInvitesGroups() async {
    if (authViewModel.token == null) {
      return [];
    }

    final id = httpService.getUserIdFromToken(authViewModel.token!);
    return (await httpService.getUserInvitesGroups(id!)) ?? [];
  }

  Future<void> createPrivateGroup(String name, int maxSize) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);

    final group = await httpService.createPrivateGroup(id!, CreatePrivateGroupRequest(name: name, maxSize: maxSize));
    groups.add(group!);
    notifyListeners();
  }

  Future<void> joinPrivateGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.joinPrivateGroup(groupId, id!);

    await getGroups();
  }

  Future<void> joinPrivateGroupWithoutInvitation(int groupId, JoinGroupWithoutInviteModel body) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.joinPrivateGroupWithoutInvitation(groupId, id!, body);

    await getGroups();
  }

  Future<void> declineGroupInvitation(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.declineGroupInvitation(groupId, id!);

    await getGroups();
  }

  Future<void> addUserToPrivateGroup(int groupId, String email) async {
    await httpService.addUserToPrivateGroup(groupId, email);
    await getGroups(); // TODO: update only the group
  }

  Future<void> deletePrivateGroup(int groupId) async {
    await httpService.deletePrivateGroup(groupId);
    groups.removeWhere((group) => group.id == groupId);
    notifyListeners();
  }

  Future<void> updatePrivateGroup(int groupId, UpdatePrivateGroupRequest updateGroupRequest) async {
    await httpService.updatePrivateGroup(groupId, updateGroupRequest);
    await getGroups(); // TODO : update only the group
  }

  Future<void> updatePublicGroup(int groupId, UpdatePublicGroupRequest updateGroupRequest) async {
    await httpService.updatePublicGroup(groupId, updateGroupRequest);
    await getGroups(); // TODO : update only the group
  }

  Future<void> removeUserFromGroup(int userId, int groupId) async {
    await httpService.removeUserFromPrivateGroup(groupId, userId);

    await getGroups(); // TODO: update only the group
  }

  Future<void> leaveGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.leaveGroup(groupId, id!);

    groups.removeWhere((group) => group.id == groupId);
    notifyListeners();
  }

  Future<void> setGroupPublic(int groupId) async {
    await httpService.setGroupPublic(groupId);
    await getGroups(); // TODO: update only the group
  }

  Future<void> getGroupPublicInfoById(int? groupId) async {
    if (groupId == null) {
      return;
    }
    groupInfo = const AsyncValue.loading();
    notifyListeners();
    final response = await httpService.getGroupPublicInfoById(groupId);
    groupInfo = response != null ? AsyncValue.data(response) : const AsyncValue.error("Group not found");
    notifyListeners();
  }

  Future<GroupInfoModel?> getGroupPublicInfo(int? groupId) async {
    if (groupId == null) {
      return null;
    }
    final response = await httpService.getGroupPublicInfoById(groupId);

    return response;
  }

  Future<void> getGroupMemories(int groupId) async {
    final memoriesResponse = await httpService.getGroupMemories(groupId);
    memories[groupId] = memoriesResponse?.memories ?? [];
  }

  Future<void> addMemoryToGroup(int groupId, String memoryUrl) async {
    final memoriesResponse = await httpService.addGroupMemory(groupId, GroupMemoryRequest(memoryUrl: memoryUrl));
    memories[groupId] = memoriesResponse?.memories ?? [];
  }

  void loadGroupMember(int groupId, num memberId) async {
    final member = await httpService.getUserPublicInfo(groupId, memberId);
    if (member != null && member.userId != null) {
      groupMembers[member.userId!.toInt()] = member;
      notifyListeners();
    }
  }
}
