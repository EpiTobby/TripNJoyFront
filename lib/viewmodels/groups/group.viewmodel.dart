import 'package:flutter/cupertino.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class GroupViewModel extends ChangeNotifier {
  GroupViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  List<GroupModel> groups = [];
  bool isLoading = false;

  void _init() async {
    isLoading = true;
    await getGroups();
    isLoading = false;
  }

  Future<void> getGroups() async {
    if (authViewModel.token == null) {
      return;
    }

    final id = httpService.getUserIdFromToken(authViewModel.token!);

    final userGroups = await httpService.getGroups(id!);
    groups = userGroups ?? [];
    notifyListeners();
  }

  Future<List<GroupModel>> getUserInvitesGroups() async {
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
    final group = await httpService.joinPrivateGroup(groupId, id!);

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

}
