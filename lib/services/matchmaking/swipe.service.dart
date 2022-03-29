import 'package:flutter/material.dart';

class SwipeService extends ChangeNotifier {
  SwipeService();

  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  bool get isDragging => _isDragging;

  Offset get position => _position;

  Size get screenSize => _screenSize;

  double get angle => _angle;

  void setScreenSize(Size ScreenSize) {
    _screenSize = ScreenSize;
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    _position = details.globalPosition;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    _angle = 30 * _position.dx / _screenSize.width;
    notifyListeners();
  }

  void endPosition(DragEndDetails details) {
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }
}
