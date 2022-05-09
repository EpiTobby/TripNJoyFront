import 'package:flutter/material.dart';

class ChatMember {
  ChatMember({
    required this.id,
    required this.name,
    required this.avatar,
  });

  num id;
  String name;
  NetworkImage avatar;
}
