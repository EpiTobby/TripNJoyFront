import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item.widget.dart';

class NotificationItemPicture extends StatelessWidget {
  const NotificationItemPicture({
    Key? key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String? title;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      leading: CircleAvatar(
        radius: 48.0,
        backgroundImage: NetworkImage(MinioService.getImageUrl(imageUrl, DEFAULT_URL.IMAGE)),
      ),
      title: title,
      subtitle: subtitle,
      onTap: onTap,
    );
  }
}
