import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';

class LayoutRowItemMember extends StatelessWidget {
  const LayoutRowItemMember({
    Key? key,
    required this.name,
    this.avatarUrl,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  final String name;
  final String? avatarUrl;
  final bool isSelected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isSelected ? Theme.of(context).colorScheme.secondary : Colors.transparent,
            radius: 28,
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl ?? DEFAULT_AVATAR_URL),
              radius: 24,
            ),
          ),
          SizedBox(
            width: 64,
            child: Text(
              name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
