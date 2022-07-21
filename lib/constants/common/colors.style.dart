import 'dart:math';
import 'dart:ui';

abstract class LightColors {
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

abstract class DarkColors {
  static const primary = Color(0xffe0e0e3);
  static const variant = Color(0xff666666);
  static const secondary = Color(0xff3a63cc);
  static const tertiary = Color(0xffc73a5d);
  static const background = Color(0xff18191e);
  static const onPrimary = Color(0xff18191e);
  static const onSecondary = Color(0xffe0e0e3);
  static const onTertiary = Color(0xff18191e);
  static const onBackground = Color(0xffe0e0e3);
  static const error = Color(0xffEB4040);
  static const onError = Color(0xffe0e0e3);
  static const surface = Color(0xff37393f);
  static const onSurface = Color(0xffe0e0e3);
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

class LightCardColors extends CardColors {
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

class DarkCardColors extends CardColors {
  static const white = Color(0xff18191e);
  static const red = Color(0xffab5959);
  static const orange = Color(0xffa66e55);
  static const yellow = Color(0xffbeb475);
  static const green = Color(0xff58835f);
  static const lightBlue = Color(0xff60959a);
  static const darkBlue = Color(0xff535d9b);
  static const purple = Color(0xff66599b);
  static const pink = Color(0xff9d6d88);
}

class ActivityColors {
  static const blue = Color(0xff2F63E0);
  static const pink = Color(0xffD8315B);
  static const red = Color(0xffDE2525);
  static const purple = Color(0xff5231D8);
  static const lightPink = Color(0xffE4329D);
  static const turquoise = Color(0xff36CAD4);
  static const green = Color(0xff2DC673);
  static const orange = Color(0xffE48732);
  static const black = Color(0xff1E1B18);
  static const grey = Color(0xff666666);
  static const greyBlue = Color(0xff4D7AB0);
  static const greyPurple = Color(0xff5B4DB0);

  static List<Color> getColors() {
    return [
      blue,
      purple,
      turquoise,
      green,
      lightPink,
      pink,
      red,
      orange,
      greyPurple,
      greyBlue,
      grey,
      black,
    ];
  }

  static Color getRandomColor() {
    return getColors()[Random().nextInt(getColors().length)];
  }

  static Color getRandomColorFromString(String? name) {
    if (name == null) {
      return getRandomColor();
    }
    return getColors()[name.length % getColors().length];
  }
}
