import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

final darkTheme = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    background: DarkColors.background,
    primary: DarkColors.primary,
    secondary: DarkColors.secondary,
    tertiary: DarkColors.tertiary,
    onBackground: DarkColors.onBackground,
    onPrimary: DarkColors.onPrimary,
    onSecondary: DarkColors.onSecondary,
    onTertiary: DarkColors.onTertiary,
    primaryContainer: DarkColors.variant,
    secondaryContainer: DarkColors.secondary.withOpacity(0.1),
    tertiaryContainer: DarkColors.tertiary.withOpacity(0.1),
    error: DarkColors.error,
    errorContainer: DarkColors.error.withOpacity(0.1),
    onError: DarkColors.onError,
    surface: DarkColors.surface,
    onSurface: DarkColors.onSurface,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(DarkColors.secondary),
  ),
  sliderTheme: const SliderThemeData(
    thumbColor: DarkColors.secondary,
    activeTickMarkColor: DarkColors.secondary,
    activeTrackColor: DarkColors.secondary,
    showValueIndicator: ShowValueIndicator.always,
    overlayColor: DarkColors.secondary,
    valueIndicatorColor: DarkColors.secondary,
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: DarkColors.background,
  ),
);
