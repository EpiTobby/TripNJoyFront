import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/groups/group.viewmodel.dart';

class QRCodeViewModel extends ChangeNotifier {
  QRCodeViewModel(this.httpService, this.groupViewModel);

  final HttpService httpService;
  final GroupViewModel groupViewModel;

  static RegExp qrCodeRegex = RegExp('tripnjoy-group-qr:([0-9]+)');

  int? groupId;
  AsyncValue<String> qrCodeBase64 = const AsyncValue.loading();

  int? extractGroupIdFromQRCode(String code) {
    var match = qrCodeRegex.firstMatch(code);
    if (match != null) {
      groupId = int.parse(match.group(1).toString());
      logger.d('QR Code valid - groupId: $groupId');
      notifyListeners();
      return groupId;
    } else {
      logger.d('QR Code invalid');
      return null;
    }
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
