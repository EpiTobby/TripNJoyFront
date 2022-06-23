import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({Key? key, this.title, required this.imageURL, this.onClick}) : super(key: key);

  final String? title;
  final String imageURL;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.secondary,
              child: const SizedBox(
                width: double.infinity,
                height: 100,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(imageURL),
                        radius: 70,
                      ),
                      if (onClick != null)
                        Positioned(
                          bottom: 0,
                          right: -15,
                          child: RawMaterialButton(
                            onPressed: () {
                              onClick!();
                            },
                            elevation: 0.5,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            child: const Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(),
                          ),
                        ),
                    ],
                  ),
                )),
          ],
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(title!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 36, fontWeight: FontWeight.w500)),
          )
      ],
    );
  }
}
