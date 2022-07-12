import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item.widget.dart';

class NotificationItemIcon extends StatelessWidget {
  const NotificationItemIcon({
    Key? key,
    required this.icon,
    this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final Icon icon;
  final String? title;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      leading: CircleAvatar(
        radius: 48.0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: icon,
      ),
      title: title,
      subtitle: subtitle,
      onTap: onTap,
    );
  }
}
