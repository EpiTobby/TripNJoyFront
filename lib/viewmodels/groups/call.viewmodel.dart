import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class CallViewModel extends ChangeNotifier {
  CallViewModel(this.httpService);

  final HttpService httpService;
  static const String channelPrefix = 'tripnjoy_call_';
  bool onCall = false;

  String getChannelName(int groupId) {
    final channelName = '$channelPrefix$groupId';
    logger.d('Agora Channel name: $channelName');
    return channelName;
  }

  Future<String> getToken(int groupId) async {
    final token = await httpService.getToken(getChannelName(groupId)) ?? AGORA_TOKEN;
    logger.d("Agora Token: $token");
    return token;
  }

  Future<void> getPermissions() {
    const permissions = [
      Permission.camera,
      Permission.microphone,
      Permission.bluetoothConnect,
      Permission.bluetooth,
    ];
    return Future.wait(permissions.map((permission) => handlePermission(permission)));
  }

  Future<void> handlePermission(Permission permission) async {
    final status = await permission.request();
    logger.d(permission.toString() + status.toString());
  }

  void setOnCall(bool value) {
    onCall = value;
    notifyListeners();
  }
}
