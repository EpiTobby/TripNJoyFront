import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

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
    logger.d("Pinned messages: ${messages.map((e) => e.content).toList()}");
    isLoadingMessages = false;
    notifyListeners();
  }

  Future<MessageResponse?> togglePinnedMessage(num messageId, bool pinned) async {
    final message = await httpService.togglePinnedMessage(messageId, pinned);
    logger.d('Toggled pinned message: ${message?.toJson().toString()}');
    if (message != null) {
      await fetchPinnedMessages(message.channelId!);
    }
    return message;
  }
}
