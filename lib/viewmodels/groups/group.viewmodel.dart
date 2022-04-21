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
  }

  Future<void> addUserToPrivateGroup(String email) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.addUserToPrivateGroup(id!, email);
  }

  Future<void> deletePrivateGroup() async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.deletePrivateGroup(id!);
  }

  Future<void> updatePrivateGroup(UpdateGroupRequest updateGroupRequest) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.updatePrivateGroup(id!, updateGroupRequest);
  }

  Future<void> removeUserFromGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.removeUserFromPrivateGroup(groupId, id!);
  }

  Future<void> leaveGroup(int groupId) async {
    final id = httpService.getUserIdFromToken(authViewModel.token!);
    await httpService.leaveGroup(groupId, id!);
  }

}