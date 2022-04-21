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

  void _init() {
    getGroups();
  }

  Future<void> getGroups() async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);

    final userGroups = await httpService.getGroups(id!);
    groups = userGroups ?? [];
    notifyListeners();
  }

  Future<void> createPrivateGroup(String name, int maxSize) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);

    final group = await httpService.createPrivateGroup(id!, CreatePrivateGroupRequest(name: name, maxSize: maxSize));
    groups.add(group!);
    notifyListeners();
  }

  Future<void> joinPrivateGroup() async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    final fakeGroupId = 1;
    final group = await httpService.joinPrivateGroup(fakeGroupId, id!);

    await getGroups();// TODO: add the group
    //groups.add(group!);
    //notifyListeners();
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

  Future<void> updatePrivateGroup(int groupId, UpdateGroupRequest updateGroupRequest) async {
    await httpService.updatePrivateGroup(groupId, updateGroupRequest);
    await getGroups(); // TODO : update only the group
  }

  Future<void> removeUserFromGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.removeUserFromPrivateGroup(groupId, id!);

    await getGroups(); // TODO: update only the group
  }

  Future<void> leaveGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.leaveGroup(groupId, id!);

    groups.removeWhere((group) => group.id == groupId);
    notifyListeners();
  }

}