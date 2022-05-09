import 'package:trip_n_joy_front/codegen/api.swagger.dart';

class PostMessageRequest {
  int userId;
  String content;
  MessageResponseType$ type;

  PostMessageRequest({
    required this.userId,
    required this.content,
    required this.type,
  });

  String toJsonString() {
    return "{\"userId\":$userId, \"content\":\"$content\", \"type\":\"${type.name.toUpperCase()}\"}";
  }
}
