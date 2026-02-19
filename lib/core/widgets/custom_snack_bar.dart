import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_padding.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/resources/font_weight_helper.dart';

enum SnackbarType { success, error, warning, info, custom }

enum SnackbarPosition { top, bottom, center }

class CustomSnackbar {
  static void show(
    BuildContext context, {
    Key? key,
    required String message,
    SnackbarType type = SnackbarType.info,
    String? title,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onAction,
    String? actionLabel,
    bool showCloseButton = true,
    IconData? customIcon,
    Color? customColor,
    Color? customTextColor,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackbarPosition position = SnackbarPosition.bottom,
    double? width,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double borderRadius = 12.0,
    double elevation = 6.0,
    bool showProgressIndicator = false,
  }) {
    final snackbarConfig = _getSnackbarConfig(type);

    final backgroundColor = customColor ?? snackbarConfig.backgroundColor;
    final textColor = customTextColor ?? snackbarConfig.textColor;
    final icon = customIcon ?? snackbarConfig.icon;

    EdgeInsets effectiveMargin;
    if (margin != null) {
      effectiveMargin = margin;
    } else {
      effectiveMargin = _getMarginForPosition(context, position, behavior);
    }

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.none,
        content: _SnackbarContent(
          message: message,
          title: title,
          icon: icon,
          textColor: textColor,
          showProgressIndicator: showProgressIndicator,
          duration: duration,
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: behavior,
        margin: effectiveMargin,
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p12,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        action: onAction != null && actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: textColor,
                onPressed: onAction,
              )
            : showCloseButton
            ? SnackBarAction(
                label: '✕',
                textColor: textColor.withValues(alpha: .7),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              )
            : null,
      ),
    );
  }

  static _SnackbarConfig _getSnackbarConfig(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarConfig(
          backgroundColor: const Color(0xFF4CAF50),
          textColor: Colors.white,
          icon: Icons.check_circle_outline,
        );
      case SnackbarType.error:
        return _SnackbarConfig(
          backgroundColor: const Color(0xFFE53935),
          textColor: Colors.white,
          icon: Icons.error_outline,
        );
      case SnackbarType.warning:
        return _SnackbarConfig(
          backgroundColor: const Color(0xFFFFA726),
          textColor: Colors.white,
          icon: Icons.warning_amber_outlined,
        );
      case SnackbarType.info:
        return _SnackbarConfig(
          backgroundColor: const Color(0xFF2196F3),
          textColor: Colors.white,
          icon: Icons.info_outline,
        );
      case SnackbarType.custom:
        return _SnackbarConfig(
          backgroundColor: const Color(0xFF424242),
          textColor: Colors.white,
          icon: Icons.notifications_outlined,
        );
    }
  }

  static EdgeInsets _getMarginForPosition(
    BuildContext context,
    SnackbarPosition position,
    SnackBarBehavior behavior,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final topPadding = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;

    if (behavior == SnackBarBehavior.fixed) {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    }

    switch (position) {
      case SnackbarPosition.top:
        return EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: topPadding + AppPadding.p16,
          bottom: screenHeight - AppSize.s200,
        );
      case SnackbarPosition.center:
        return EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: (screenHeight / 2) - (AppSize.s100 / 2),
          bottom: (screenHeight / 2) - (AppSize.s100 / 2),
        );
      case SnackbarPosition.bottom:
        return EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          bottom: bottomPadding + AppPadding.p16,
          top: AppPadding.p16,
        );
    }
  }
}

class _SnackbarConfig {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  _SnackbarConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });
}

class _SnackbarContent extends StatelessWidget {
  final String message;
  final String? title;
  final IconData icon;
  final Color textColor;
  final bool showProgressIndicator;
  final Duration duration;

  const _SnackbarContent({
    required this.message,
    this.title,
    required this.icon,
    required this.textColor,
    required this.showProgressIndicator,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: textColor, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Text(title!, style: textTheme.titleMedium),
                const SizedBox(height: 4),
              ],
              Text(
                message,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: title != null
                      ? FontWeightHelper.regular
                      : FontWeightHelper.medium,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (showProgressIndicator) ...[
          const SizedBox(width: 12),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        ],
      ],
    );
  }
}
