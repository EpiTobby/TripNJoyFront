import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/group/qr_code_info.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/groups/group.viewmodel.dart';

class QRCodeViewModel extends ChangeNotifier {
  QRCodeViewModel(this.httpService, this.groupViewModel);

  final HttpService httpService;
  final GroupViewModel groupViewModel;

  static RegExp qrCodeRegex = RegExp('([0-9]+);([^;]*)\$');

  int? groupId;
  String? hash;
  AsyncValue<String> qrCodeBase64 = const AsyncValue.loading();

  QRCodeInfo? extractGroupIdFromQRCode(String code) {
    logger.d("Extracting group id from qr code: $code");
    var match = qrCodeRegex.firstMatch(code);
    if (match != null) {
      groupId = int.parse(match.group(1).toString());
      hash = match.group(2).toString();
      logger.d('QR Code valid - groupId: $groupId - hash: $hash');
      notifyListeners();
      return QRCodeInfo(groupId: groupId, hash: hash);
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
