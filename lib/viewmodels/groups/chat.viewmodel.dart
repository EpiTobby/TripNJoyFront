import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/post_message_request.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_message.widget.dart';
import 'package:stomp_dart_client/stomp.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  List<MessageResponse> messages = [];
  StompClient? client;
  num? channelId;

  void _init() {
    loadWebSocketChannel();
    getMessages();
  }

  void loadWebSocketChannel() async {
    logger.d('opening channel');
    client ??= await httpService.loadWebSocketChannel();
    logger.d(client);
    notifyListeners();
  }

  void closeWebSocketChannel() {
    logger.d('Closing WebSocketChannel');
    client?.deactivate();
    notifyListeners();
  }

  void getMessages() async {
    if (channelId != null) {
      var msgs = await httpService.getChannelMessages(channelId!, 0);
      for (var element in msgs) {
        if (element.content != null) {
          messages.add(element);
        }
      }
    }
    notifyListeners();
  }

  void addAttachFile(String path) async {
    // messages.add(
    //   Column(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           print("Tapped");
    //         },
    //         child: Container(
    //           alignment: Alignment.center,
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8.0),
    //             color: Colors.grey[200],
    //           ),
    //           child: Text(
    //             path.split("?").first,
    //             style: TextStyle(
    //               fontSize: 12.0,
    //               color: Colors.grey[600],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    notifyListeners();
  }

  void addImage(String url) async {
    // messages.add(
    //   Column(
    //     children: [
    //       Image(image: NetworkImage(url), width: 200, height: 200),
    //     ],
    //   ),
    // );
    notifyListeners();
  }

  void sendMessage(String message) async {
    if (message.isNotEmpty) {
      var body = PostMessageRequest(userId: httpService.getUserIdFromToken(authViewModel.token)!, content: message)
          .toJsonString();
      logger.i(body);
      client?.send(destination: '/app/chat/$channelId', body: body, headers: {});
    }
  }

  void setChannelId(num? id) {
    channelId = id;
  }

  void clear() {
    messages.clear();
    channelId = null;
    notifyListeners();
  }

  void addMessage(String? body) {
    if (body != null) {
      var message = MessageResponse.fromJson(jsonDecode(body));
      messages.add(message);
    }
  }
}
