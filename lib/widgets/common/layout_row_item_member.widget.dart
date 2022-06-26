import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class LayoutRowItemMember extends StatelessWidget {
  const LayoutRowItemMember({
    Key? key,
    required this.name,
    this.avatarUrl,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String? avatarUrl;
  final bool isSelected;
  final void Function(bool) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () => onTap(!isSelected),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: isSelected ? Theme.of(context).colorScheme.secondary : Colors.transparent,
              radius: 28,
              child: CircleAvatar(
                backgroundImage: NetworkImage(MinioService.getImageUrl(avatarUrl, DEFAULT_URL.AVATAR)),
                radius: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 64,
                child: Text(
                  name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color:
                          isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
