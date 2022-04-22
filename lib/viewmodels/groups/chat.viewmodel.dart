import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_message.widget.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  List<Widget> messages = [];

  void _init() {
    getMessages();
  }

  void getMessages() {
    messages = [
      ChatMessage(
        message: "testMesssage",
        username: "Tony",
        isUser: true,
        isFirst: true,
        time: DateTime.now().subtract(const Duration(days: 1)),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test",
        username: "Yakoi",
        isUser: false,
        isFirst: true,
        time: DateTime.now(),
      ),
      ChatMessage(
        message: "Hello world",
        username: "Yakoi",
        isUser: false,
        isFirst: false,
        time: DateTime.now(),
      ),
      ChatMessage(
        message: "Test for a short messsage",
        username: "Tony",
        isUser: true,
        isFirst: true,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a medium messsage that can be send by the user",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
      ChatMessage(
        message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
        username: "Tony",
        isUser: true,
        isFirst: false,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ),
    ];
    notifyListeners();
  }

  void addAttachFile(String path) async {
    messages.add(
      Column(
        children: [
          InkWell(
            onTap: () {
              print("Tapped");

            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Text(
                path.split("?").first,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    notifyListeners();
  }

  void addImage(String url) async {
    messages.add(
      Column(
        children: [
          Image(image: NetworkImage(url), width: 200, height: 200),
        ],
      ),
    );
    notifyListeners();
  }

  void sendMessage(String message) async {
    if (message.isNotEmpty) {
      messages.add(ChatMessage(
        message: message,
        username: "Tony",
        isUser: true,
        isFirst: true,
        time: DateTime.now(),
        userAvatar:
            "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      ));
      notifyListeners();
    }
  }
}
