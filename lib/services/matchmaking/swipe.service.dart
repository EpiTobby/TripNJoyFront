import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/services/matchmaking/matchmaking.service.dart';

import '../../constants/matchmaking/card_status.enum.dart';
import '../log/logger.service.dart';

class SwipeService extends ChangeNotifier {
  SwipeService(this.matchmakingService);

  final MatchmakingService matchmakingService;

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
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    _angle = 10 * _position.dx / _screenSize.width;
    notifyListeners();
  }

  void endPosition(DragEndDetails details) {
    _isDragging = false;
    notifyListeners();

    final status = getCardStatus();

    switch (status) {
      case CardStatus.LEFT:
        swipeLeft();
        break;
      case CardStatus.RIGHT:
        swipeRight();
        break;
      case CardStatus.BOTTOM:
        swipeBottom();
        break;
      default:
        resetPosition();
        break;
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  CardStatus? getCardStatus() {
    final x = _position.dx;
    final y = _position.dy;
    final delta = _screenSize.width / 4;
    final forceBottom = x.abs() < _screenSize.width / 2;

    if (y >= delta / 2 && forceBottom) {
      return CardStatus.BOTTOM;
    } else if (x >= delta) {
      return CardStatus.RIGHT;
    } else if (x <= -delta) {
      return CardStatus.LEFT;
    }
  }

  void swipeLeft() {
    _angle = -30;
    _position -= Offset(2 * _screenSize.width, 0);
    notifyListeners();
    nextCard();
    logger.i('Swipe Left');
    notifyListeners();
  }

  void swipeRight() {
    _angle = 30;
    _position += Offset(2 * _screenSize.width, 0);
    notifyListeners();
    nextCard();
    logger.i('Swipe Right');
    notifyListeners();
  }

  void swipeBottom() {
    _angle = 0;
    _position += Offset(0, 2 * _screenSize.height);
    notifyListeners();
    nextCard();
    logger.i('Swipe bottom');
    notifyListeners();
  }

  void nextCard() async {
    Future.delayed(const Duration(milliseconds: 200), () {
      matchmakingService.nextCard();
      resetPosition();
    });
  }
}
