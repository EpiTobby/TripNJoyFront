import 'package:flutter/material.dart';

class CardModel {
  Widget Function(BuildContext context, bool onTop) builder;

  CardModel({
    required this.builder,
  });

  Widget build(BuildContext context, bool onTop) {
    return builder(context, onTop);
  }
}
