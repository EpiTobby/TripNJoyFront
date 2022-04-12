import 'package:flutter/material.dart';

import '../../constants/matchmaking/card_status.enum.dart';
import '../../services/log/logger.service.dart';
import 'matchmaking.viewmodel.dart';

class SwipeViewModel extends ChangeNotifier {
  SwipeViewModel(this.matchmakingViewModel);

  final MatchmakingViewModel matchmakingViewModel;

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

  void endPosition(DragEndDetails details, String name, List<String> values) {
    _isDragging = false;
    notifyListeners();

    final status = getCardStatus();

    switch (status) {
      case CardStatus.LEFT:
        swipeLeft(name, values[0]);
        break;
      case CardStatus.RIGHT:
        swipeRight(name, values[1]);
        break;
      case CardStatus.DOWN:
        swipeDown(name, values[2]);
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
    final forceDown = x.abs() < _screenSize.width / 2;

    if (y >= delta / 2 && forceDown) {
      return CardStatus.DOWN;
    } else if (x >= delta) {
      return CardStatus.RIGHT;
    } else if (x <= -delta) {
      return CardStatus.LEFT;
    }
  }

  void swipeLeft(String name, String value) {
    _angle = -30;
    _position -= Offset(2 * _screenSize.width, 0);
    notifyListeners();
    nextCard(name, value);
    logger.i('Swipe Left');
    notifyListeners();
  }

  void swipeRight(String name, String value) {
    _angle = 30;
    _position += Offset(2 * _screenSize.width, 0);
    notifyListeners();
    nextCard(name, value);
    logger.i('Swipe Right');
    notifyListeners();
  }

  void swipeDown(String name, String value) {
    _angle = 0;
    _position += Offset(0, 2 * _screenSize.height);
    notifyListeners();
    nextCard(name, value);
    logger.i('Swipe Down');
    notifyListeners();
  }

  void nextCard(String name, String value) async {
    Future.delayed(const Duration(milliseconds: 200), () {
      matchmakingViewModel.submitCard(name, value);
      resetPosition();
    });
  }
}
