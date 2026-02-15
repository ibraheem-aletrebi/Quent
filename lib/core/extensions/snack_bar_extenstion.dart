import 'package:flutter/material.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';

extension CustomSnackbarExtension on BuildContext {
  void showSnackbar(
    String message, {
    SnackbarType type = SnackbarType.info,
    String? title,
    Duration duration = const Duration(seconds: 2),
    SnackbarPosition position = SnackbarPosition.top,
  }) {
    CustomSnackbar.show(
      this,
      message: message,
      type: type,
      title: title,
      duration: duration,
      position: position,
    );
  }
}
