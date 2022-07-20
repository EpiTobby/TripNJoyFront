import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    background: CColors.background,
    primary: CColors.primary,
    secondary: CColors.secondary,
    tertiary: CColors.tertiary,
    onBackground: CColors.onBackground,
    onPrimary: CColors.onPrimary,
    onSecondary: CColors.onSecondary,
    onTertiary: CColors.onTertiary,
    primaryContainer: CColors.variant,
    secondaryContainer: CColors.secondary.withOpacity(0.1),
    tertiaryContainer: CColors.tertiary.withOpacity(0.1),
    error: CColors.error,
    errorContainer: CColors.error.withOpacity(0.1),
    onError: CColors.onError,
    surface: CColors.surface,
    onSurface: CColors.onSurface,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(CColors.secondary),
  ),
  sliderTheme: const SliderThemeData(
    thumbColor: CColors.secondary,
    activeTickMarkColor: CColors.secondary,
    activeTrackColor: CColors.secondary,
    showValueIndicator: ShowValueIndicator.always,
    overlayColor: CColors.secondary,
    valueIndicatorColor: CColors.secondary,
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: CColors.background,
  ),
);
