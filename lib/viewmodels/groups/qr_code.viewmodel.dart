import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/groups/group.viewmodel.dart';

class QRCodeViewModel extends ChangeNotifier {
  QRCodeViewModel(this.httpService, this.groupViewModel);

  final HttpService httpService;
  final GroupViewModel groupViewModel;

  int? groupId = 100;
  AsyncValue<String> qrCodeBase64 = const AsyncValue.loading();

  void extractGroupIdFromQRCode(String code) {
    // TODO: check identifier is present and extract groupId
    groupId = 100;
    notifyListeners();
  }

  bool checkGroupAlreadyJoined(int? groupId) {
    return groupViewModel.groups.any((group) => group.id == groupId);
  }

  void getGroupQRCode(int? groupId) async {
    if (groupId == null) {
      qrCodeBase64 = const AsyncValue.error(
        'GroupId is null',
      );
      notifyListeners();
      return;
    }
    qrCodeBase64 = const AsyncValue.loading();
    notifyListeners();
    var response = await httpService.getGroupQRCode(groupId);
    qrCodeBase64 = response != null ? AsyncValue.data(response) : const AsyncValue.error('Failed to get QR Code');
    notifyListeners();
  }
}
