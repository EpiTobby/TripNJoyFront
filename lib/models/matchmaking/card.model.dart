import 'package:flutter/material.dart';

class CardModel {
  Widget Function(BuildContext context, bool onTop, bool isLoading) builder;

  CardModel({
    required this.builder,
  });

  Widget build(BuildContext context, bool onTop, bool isLoading) {
    return builder(context, onTop, isLoading);
  }
}
