import 'dart:ui';

abstract class CColors {
  static const white0 = Color(0xffffffff);
  static const black100 = Color(0xff000000);
  static const primary = Color(0xff1E1B18);
  static const variant = Color(0xff666666);
  static const secondary = Color(0xff2F63E0);
  static const tertiary = Color(0xffD8315B);
  static const background = Color(0xffFAFAFF);
  static const onPrimary = Color(0xffFAFAFF);
  static const onSecondary = Color(0xffFAFAFF);
  static const onTertiary = Color(0xffFAFAFF);
  static const onBackground = Color(0xff1E1B18);
  static const error = Color(0xffEB4040);
  static const onError = Color(0xffFAFAFF);
  static const surface = Color(0xffEBEBFA);
  static const onSurface = Color(0xff1E1B18);
}

abstract class CardColors {
  static const white = Color(0xffFAFAFF);
  static const red = Color(0xffFAD2D2);
  static const orange = Color(0xfffae0d2);
  static const yellow = Color(0xffFAF1D2);
  static const green = Color(0xffDAFAD2);
  static const lightBlue = Color(0xffD2F8FA);
  static const darkBlue = Color(0xffD2D8FA);
  static const purple = Color(0xffD8D2FA);
  static const pink = Color(0xffFAD2E8);
}

class ActivityColors {
  static const blue = Color(0xff2F63E0);
  static const pink = Color(0xffD8315B);
  static const red = Color(0xffD83131);
  static const purple = Color(0xff5231D8);
  static const turquoise = Color(0xff3192D8);

  static Color getColor(String color) {
    switch (color) {
      case 'blue':
        return blue;
      case 'pink':
        return pink;
      case 'red':
        return red;
      case 'purple':
        return purple;
      case 'turquoise':
        return turquoise;
      default:
        return blue;
    }
  }
}
