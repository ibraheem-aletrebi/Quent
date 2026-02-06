import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/resources/font_family_helper.dart';
import 'package:quent/core/resources/font_weight_helper.dart';

class TextStyles {
  TextStyles._();

  // Regular
  static final TextStyle regular12 = _buildTextStyle(
    fontSize: AppSize.s12,
    fontWeight: FontWeightHelper.regular,
  );

  static final TextStyle regular14 = _buildTextStyle(
    fontSize: AppSize.s14,
    fontWeight: FontWeightHelper.regular,
  );

  static final TextStyle regular16 = _buildTextStyle(
    fontSize: AppSize.s16,
    fontWeight: FontWeightHelper.regular,
  );

  // Medium
  static final TextStyle medium12 = _buildTextStyle(
    fontSize: AppSize.s12,
    fontWeight: FontWeightHelper.medium,
  );
  
  static final TextStyle medium14 = _buildTextStyle(
    fontSize: AppSize.s14,
    fontWeight: FontWeightHelper.medium,
  );

  static final TextStyle medium16 = _buildTextStyle(
    fontSize: AppSize.s16,
    fontWeight: FontWeightHelper.medium,
  );

  // SemiBold
  static final TextStyle semiBold14 = _buildTextStyle(
    fontSize: AppSize.s14,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final TextStyle semiBold16 = _buildTextStyle(
    fontSize: AppSize.s16,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final TextStyle semiBold18 = _buildTextStyle(
    fontSize: AppSize.s18,
    fontWeight: FontWeightHelper.semiBold,
  );

  // Bold
  // static final TextStyle bold18 = _buildTextStyle(
  //   fontSize: AppSizeHelper.s18,
  //   fontWeight: FontWeightHelper.bold,
  // );

  static final TextStyle bold20 = _buildTextStyle(
    fontSize: AppSize.s20,
    fontWeight: FontWeightHelper.bold,
  );

  static final TextStyle bold32 = _buildTextStyle(
    fontSize: AppSize.s32,
    fontWeight: FontWeightHelper.bold,
  );
}

TextStyle _buildTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
