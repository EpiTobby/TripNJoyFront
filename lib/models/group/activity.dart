import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/extensions/HexColor.extension.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

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

  static Activity fromActivityResponse(ActivityResponse activity) {
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
                  avatar: NetworkImage(MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR))))
              .toList() ??
          [],
      color: HexColor.fromHex(activity.color!),
    );
  }

  String getActivityDateFormat() {
    return startDate.day == endDate.day && startDate.month == endDate.month && startDate.year == endDate.year
        ? "${DateFormat("dd/MM HH:mm").format(startDate)} - ${DateFormat("HH:mm").format(endDate)}"
        : "${DateFormat("HH:mm dd/MM/yyyy").format(startDate)} - ${DateFormat("HH:mm dd/MM/yyyy").format(endDate)}";
  }

  static String getStaticActivityDateFormat(DateTime startDate, DateTime endDate) {
    return startDate.day == endDate.day && startDate.month == endDate.month && startDate.year == endDate.year
        ? "${DateFormat("dd/MM HH:mm").format(startDate)} - ${DateFormat("HH:mm").format(endDate)}"
        : "${DateFormat("HH:mm dd/MM/yyyy").format(startDate)} - ${DateFormat("HH:mm dd/MM/yyyy").format(endDate)}";
  }
}
