import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/extensions/HexColor.extension.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';

class Activity {
  Activity({
    required this.id,
    required this.icon,
    this.name,
    this.location,
    required this.startDate,
    required this.endDate,
    this.description,
    this.members = const [],
    this.color = ActivityColors.blue,
  });

  num id;
  IconData icon;
  String? name;
  String? location;
  DateTime startDate;
  DateTime endDate;
  String? description;
  List<ChatMember> members;
  Color color;

  static Activity fromActivityResponse(ActivityModel activity) {
    return Activity(
      id: activity.id!,
      icon: IconData(int.parse(activity.icon!), fontFamily: 'MaterialIcons'),
      name: activity.name,
      location: activity.location,
      startDate: activity.startDate!,
      endDate: activity.endDate!,
      description: activity.description,
      members: activity.participants
              ?.map((e) => ChatMember(
                  id: e.userId!,
                  name: "${e.firstname} ${e.lastname}",
                  avatar: NetworkImage(e.profilePicture ?? DEFAULT_AVATAR_URL)))
              .toList() ??
          [],
      color: HexColor.fromHex(activity.color!),
    );
  }
}
