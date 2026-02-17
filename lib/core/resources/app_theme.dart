import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quent/core/resources/app_border.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/font_family_helper.dart';
import 'package:quent/core/resources/text_styles.dart';

ThemeData buildLightTheme(Locale locale) {
  ThemeData lightTheme = ThemeData(
    fontFamily: FontFamilyHelper.fromLocale(locale),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLightColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      error: AppColors.errorColor,

      brightness: Brightness.dark,
    ),

    textTheme: TextTheme(
      bodySmall: TextStyles.regular14.copyWith(
        color: AppColors.secondaryLightTextColor,
      ),
      titleLarge: TextStyles.semiBold18,
      titleMedium: TextStyles.semiBold16,
      titleSmall: TextStyles.semiBold14,
      displayLarge: TextStyles.bold32,
      displayMedium: TextStyles.bold20,
      displaySmall: TextStyles.regular16.copyWith(
        color: AppColors.secondaryLightTextColor,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.black),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.transparent,
      ),
    ),

    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.dark,
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
        splashFactory: NoSplash.splashFactory,
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
        borderSide: const BorderSide(
          color: AppColors.borderLightColor,
          width: 1,
        ),
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
      contentPadding: EdgeInsets.all(16),
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

  return lightTheme;
}

ThemeData buildDarkTheme(Locale locale) {
  ThemeData darkTheme = ThemeData(
    fontFamily: FontFamilyHelper.fromLocale(locale),
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      error: AppColors.errorColor,

      brightness: Brightness.dark,
    ),

    textTheme: TextTheme(
      bodySmall: TextStyles.regular14.copyWith(
        color: AppColors.secondaryDarkTextColor,
      ),
      titleLarge: TextStyles.semiBold18,
      titleMedium: TextStyles.semiBold16,
      titleSmall: TextStyles.semiBold14,
      displayLarge: TextStyles.bold32,
      displayMedium: TextStyles.bold20,
      displaySmall: TextStyles.regular16.copyWith(
        color: AppColors.secondaryDarkTextColor,
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.transparent,
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white),
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
        splashFactory: NoSplash.splashFactory,
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
        borderSide: const BorderSide(
          color: AppColors.surfaceDarkColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorder.b12),
        borderSide: const BorderSide(
          color: AppColors.surfaceDarkColor,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorder.b12),
        borderSide: BorderSide(color: AppColors.surfaceDarkColor, width: 1),
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(16),
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

  return darkTheme;
}
