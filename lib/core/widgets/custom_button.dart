import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_elevation.dart';
import 'package:quent/core/resources/app_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? textColor;
  final IconData? icon;
  final double? borderRadius;
  final Color? borderColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.disabledColor,
    this.textColor,
    this.icon,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = enabled && !isLoading;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppSize.s50,
      child: ElevatedButton.icon(
        onPressed: isButtonEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s8),
          ),
          side: BorderSide(color: borderColor ?? Colors.transparent),
          elevation: isButtonEnabled ? AppElevation.e2 : AppElevation.e0,
        ),
        icon: isLoading
            ? SizedBox(
                height: AppSize.s18,
                width: AppSize.s18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              )
            : icon != null
            ? Icon(icon)
            : null,
        label: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
