import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item_icon.widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).colorScheme.primary.withAlpha(0x33),
              ),
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return NotificationItemIcon(
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.background,
                ),
                title: 'Welcome to TripNJoy',
                subtitle: 'We hope you enjoy your trips!',
                onTap: () {},
              );
            }
            return NotificationItemIcon(
              icon: Icon(
                Icons.add_circle_rounded,
                color: Theme.of(context).colorScheme.background,
              ),
              title: 'Create your first travel profile',
              subtitle: 'Go to the matchmaking page and find your perfect trip!',
              onTap: () {},
            );
          }),
    );
  }
}
