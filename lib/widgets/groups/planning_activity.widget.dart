import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

class PlanningActivity extends StatelessWidget {
  const PlanningActivity({
    Key? key,
    this.prefix,
    this.title,
    this.subtitle,
    this.subsubtitle,
    this.description,
    this.members = const [],
    this.onTap,
    this.color = ActivityColors.blue,
  }) : super(key: key);

  final Widget? prefix;
  final String? title;
  final String? subtitle;
  final String? subsubtitle;
  final String? description;
  final List<String> members;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 10,
                spreadRadius: -5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              if (prefix != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 64, height: 64, child: prefix!),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...members.take(2).map((member) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundImage: NetworkImage(member),
                                  ),
                                );
                              }).toList(),
                              if (members.length > 2)
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.background,
                                    radius: 8,
                                    child: Center(
                                      child: Text(
                                        '+${members.length - 2}',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Theme.of(context).colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      if (subsubtitle != null)
                        Text(
                          subsubtitle!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      if (description != null)
                        Text(
                          description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                    ],
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
