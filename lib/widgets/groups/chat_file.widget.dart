import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class ChatFile extends StatelessWidget {
  const ChatFile({Key? key, required this.path, required this.isUser}) : super(key: key);

  final String path;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        logger.d("Tapped");
      },
      child: Padding(
        padding: isUser ? const EdgeInsets.only(right: 32, bottom: 4) : const EdgeInsets.only(left: 32, bottom: 4),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: isUser ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: isUser
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.4)
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                offset: const Offset(0, 8),
                blurRadius: 14,
                spreadRadius: -6,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.file_present,
                  color: isUser ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    path.split("$MINIO_BUCKET/").last,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          isUser ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
