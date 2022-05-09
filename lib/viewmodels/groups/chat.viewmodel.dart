import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/post_message_request.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  List<MessageResponse> messages = [];
  bool isConnectedToSocket = false;
  List<num> listeningChannels = [];
  StompClient? client;
  bool isLoadingMessages = true;
  bool mounted = true;

  void _init() {
    loadWebSocketChannel();
  }

  @override
  void dispose() {
    closeWebSocketChannel();
    mounted = false;
    super.dispose();
  }

  void loadWebSocketChannel() async {
    logger.d('Load WebSocketChannel');
    client = await httpService.loadWebSocketChannel((isConnected) {
      if (mounted) {
        isConnectedToSocket = isConnected;
        if (!isConnectedToSocket) {
          logger.d('WebSocketChannel is not connected');
          listeningChannels.clear();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void closeWebSocketChannel() {
    logger.d('Closing WebSocketChannel');
    client?.deactivate();
    client = null;
    isConnectedToSocket = false;
    listeningChannels.clear();
    notifyListeners();
  }

  void getMessages(num? channelId) async {
    if (channelId != null) {
      isLoadingMessages = true;
      clearMessages();
      var channelMessages = await httpService.getChannelMessages(channelId, 0);
      for (var msg in channelMessages) {
        if (msg.content != null) {
          messages.add(msg);
        }
      }
      isLoadingMessages = false;
    }
    notifyListeners();
  }

  void clearMessages() {
    messages.clear();
    notifyListeners();
  }

  void sendMessage(num? channelId, String message, MessageResponseType$ type) async {
    if (message.isNotEmpty && channelId != null) {
      var body =
          PostMessageRequest(userId: httpService.getUserIdFromToken(authViewModel.token)!, content: message, type: type)
              .toJsonString();
      logger.i("/app/chat/$channelId - $body");
      client?.send(destination: '/app/chat/$channelId', body: body, headers: {});
    }
  }

  void addMessage(num? channelId, String? body) {
    if (body != null) {
      var message = MessageResponse.fromJson(jsonDecode(body));
      if (message.channelId == channelId) {
        messages.insert(0, message);
        notifyListeners();
      }
    }
  }

  void listenToChannel(num? channelId) {
    if (channelId != null && !listeningChannels.contains(channelId)) {
      listeningChannels.add(channelId);
      logger.i("listening to channel $channelId - listened channels: ${listeningChannels.toString()}");
      client?.subscribe(
        destination: '/topic/response/$channelId',
        callback: (frame) {
          logger.i('Received message: ${frame.body}');
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            addMessage(channelId, frame.body);
          });
        },
      );
    }
  }
}
