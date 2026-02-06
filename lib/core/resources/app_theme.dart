import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quent/core/resources/app_border.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/text_styles.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundLightColor,
  disabledColor: AppColors.tertiaryLightColor,
  dividerColor: AppColors.dividerLightColor,

  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    error: AppColors.errorColor,
    surface: AppColors.surfaceLightColor,
    outline: AppColors.surfaceLightColor,
    brightness: Brightness.dark,
  ),

  textTheme: TextTheme(
    bodySmall: TextStyles.regular14.copyWith(
      color: AppColors.secondaryLightTextColor,
    ),
    titleLarge: TextStyles.semiBold18,
    titleMedium: TextStyles.semiBold16,
    displayLarge: TextStyles.bold32,
    displayMedium: TextStyles.bold20,
    displaySmall: TextStyles.regular16.copyWith(
      color: AppColors.secondaryLightTextColor,
    ),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.surfaceLightColor,
    ),
  ),

  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: AppColors.backgroundLightColor,
    foregroundColor: AppColors.black,
    elevation: 2,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.tertiaryLightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      disabledForegroundColor: AppColors.tertiaryLightColor,
      foregroundColor: AppColors.primaryColor,
      textStyle: TextStyles.semiBold16,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyles.medium16,
    hintStyle: TextStyles.regular14.copyWith(
      color: AppColors.secondaryLightTextColor,
    ),
    errorStyle: TextStyles.medium12.copyWith(color: AppColors.errorColor),
    iconColor: AppColors.secondaryLightTextColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: const BorderSide(color: AppColors.borderLightColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: const BorderSide(
        color: AppColors.surfaceLightColor,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: BorderSide(
        color: AppColors.tertiaryLightColor.withValues(alpha: 0.5),
        width: 1,
      ),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: AppPadding.p16,
      horizontal: AppPadding.p24,
    ),
    filled: true,
    fillColor: AppColors.surfaceLightColor,
  ),

  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(AppColors.primaryDarkTextColor),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.transparent;
    }),
    side: BorderSide(color: AppColors.borderDarkColor, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppBorder.b4),
    ),
  ),

  splashFactory: NoSplash.splashFactory,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundDarkColor,
  disabledColor: AppColors.tertiaryDarkColor,
  dividerColor: AppColors.dividerDarkColor,

  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor,
    error: AppColors.errorColor,
    surface: AppColors.surfaceDarkColor,
    outline: AppColors.surfaceDarkColor,
    brightness: Brightness.dark,
  ),

  textTheme: TextTheme(
    bodySmall: TextStyles.regular14.copyWith(
      color: AppColors.secondaryDarkTextColor,
    ),
    titleLarge: TextStyles.semiBold18,
    titleMedium: TextStyles.semiBold16,
    displayLarge: TextStyles.bold32,
    displayMedium: TextStyles.bold20,
    displaySmall: TextStyles.regular16.copyWith(
      color: AppColors.secondaryDarkTextColor,
    ),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.surfaceDarkColor,
    ),
  ),

  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: AppColors.backgroundDarkColor,
    foregroundColor: AppColors.white,
    elevation: 2,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.tertiaryDarkColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      disabledForegroundColor: AppColors.tertiaryDarkColor,
      foregroundColor: AppColors.primaryColor,
      textStyle: TextStyles.semiBold16,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyles.medium16,
    hintStyle: TextStyles.regular14.copyWith(
      color: AppColors.secondaryDarkTextColor,
    ),
    errorStyle: TextStyles.medium12.copyWith(color: AppColors.errorColor),
    iconColor: AppColors.secondaryDarkTextColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: const BorderSide(color: AppColors.surfaceDarkColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: const BorderSide(color: AppColors.surfaceDarkColor, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorder.b12),
      borderSide: BorderSide(
        color: AppColors.tertiaryDarkColor.withValues(alpha: 0.5),
        width: 1,
      ),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: AppPadding.p16,
      horizontal: AppPadding.p24,
    ),
    filled: true,
    fillColor: AppColors.surfaceDarkColor,
  ),

  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(AppColors.primaryDarkTextColor),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.transparent;
    }),
    side: BorderSide(color: AppColors.borderDarkColor, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppBorder.b4),
    ),
  ),

  splashFactory: NoSplash.splashFactory,
);
