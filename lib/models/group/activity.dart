import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';

class Activity {
  Activity({
    required this.id,
    required this.icon,
    this.title,
    this.subtitle,
    this.subsubtitle,
    this.description,
    this.members = const [],
    this.color = ActivityColors.blue,
  });

  int id;
  IconData icon;
  String? title;
  String? subtitle;
  String? subsubtitle;
  String? description;
  List<ChatMember> members;
  Color color;

  static Activity fromActivityResponse(Activity e) {
    return e;
  }
}
