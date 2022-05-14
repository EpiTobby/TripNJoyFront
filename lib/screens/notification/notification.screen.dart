import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item.widget.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item_icon.widget.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item_picture.widget.dart';

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
        itemCount: 4,
        itemBuilder: (context, index) => NotificationItemPicture(
          imageUrl: "https://as2.ftcdn.net/v2/jpg/01/81/75/23/1000_F_181752325_chPCE32kZXwYmHxhwPdfaaGio7Pr3v5V.jpg",
          title: 'New Trip',
          subtitle: 'You have a new trip request. Check it out! More information will be added soon.',
          onTap: () {},
        ),
      ),
    );
  }
}
