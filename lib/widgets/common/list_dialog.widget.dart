import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListDialog extends HookConsumerWidget {
  const ListDialog({
    Key? key,
    required this.items,
    this.onSelect,
  }) : super(key: key);

  final List<SearchInfo> items;
  final Function(SearchInfo)? onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: items
                  .where((item) => item.point != null && item.address != null)
                  .map(
                    (e) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            e.address!.name ?? '',
                            style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                          ),
                          subtitle: Text(
                            "${e.address!.street ?? ''}, ${e.address!.city ?? ''}, ${e.address!.country ?? ''}, ${e.address!.postcode ?? ''}",
                            style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary),
                          ),
                          onTap: () {
                            if (onSelect != null) {
                              onSelect!(e);
                            }
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
