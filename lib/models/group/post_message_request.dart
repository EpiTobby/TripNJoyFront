class PostMessageRequest {
  int userId;
  String content;

  PostMessageRequest({
    required this.userId,
    required this.content,
  });

  String toJsonString() {
    return "{\"userId\":$userId, \"content\":\"$content\"}";
  }
}
