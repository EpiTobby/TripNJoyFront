import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({Key? key, required this.value, required this.data}) : super(key: key);
  final AsyncValue<T> value;

  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, _) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
