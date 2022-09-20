import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/notification/notification.provider.dart';
import 'package:trip_n_joy_front/widgets/notifications/notification_item_icon.widget.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(notificationProvider.notifier).getNotifications();
      return null;
    }, []);
    final notifications = ref.watch(notificationProvider);
    return RefreshIndicator(
      onRefresh: () => ref.read(notificationProvider.notifier).getNotifications(),
      color: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Theme.of(context).colorScheme.primary.withAlpha(0x33),
                ),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationItemIcon(
                icon: Icon(
                  Icons.chat,
                  color: Theme.of(context).colorScheme.background,
                ),
                title: notification.title,
                subtitle: notification.body,
                onTap: () {},
              );
            }),
      ),
    );
  }
}
