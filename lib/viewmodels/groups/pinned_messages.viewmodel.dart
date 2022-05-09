import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class PinnedMessagesViewModel extends ChangeNotifier {
  PinnedMessagesViewModel(this.httpService) : super();

  final HttpService httpService;

  List<MessageResponse> pinnedMessages = [];
  bool isLoadingMessages = false;

  Future<void> fetchPinnedMessages(num channelId) async {
    isLoadingMessages = true;
    notifyListeners();
    final messages = await httpService.getPinnedMessages(channelId);
    pinnedMessages = messages;
    isLoadingMessages = false;
    notifyListeners();
  }
}
