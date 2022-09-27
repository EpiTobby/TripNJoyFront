import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    background: LightColors.background,
    primary: LightColors.primary,
    secondary: LightColors.secondary,
    tertiary: LightColors.tertiary,
    onBackground: LightColors.onBackground,
    onPrimary: LightColors.onPrimary,
    onSecondary: LightColors.onSecondary,
    onTertiary: LightColors.onTertiary,
    primaryContainer: LightColors.variant,
    secondaryContainer: LightColors.secondary.withOpacity(0.1),
    tertiaryContainer: LightColors.tertiary.withOpacity(0.1),
    error: LightColors.error,
    errorContainer: LightColors.error.withOpacity(0.1),
    onError: LightColors.onError,
    surface: LightColors.surface,
    onSurface: LightColors.onSurface,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(LightColors.secondary),
  ),
  sliderTheme: const SliderThemeData(
    thumbColor: LightColors.secondary,
    activeTickMarkColor: LightColors.secondary,
    activeTrackColor: LightColors.secondary,
    showValueIndicator: ShowValueIndicator.always,
    overlayColor: LightColors.secondary,
    valueIndicatorColor: LightColors.secondary,
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: LightColors.background,
  ),
);
