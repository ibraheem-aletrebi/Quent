import 'package:flutter/material.dart';
import 'package:quent/core/widgets/custom_snack_bar.dart';

extension CustomSnackbarExtension on BuildContext {
  void showSnackbar(
    String message, {
    SnackbarType type = SnackbarType.success,
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackbarPosition position = SnackbarPosition.top,
    bool showCloseButton = false,
  }) {
    CustomSnackbar.show(
      this,
      message: message,
      type: type,
      title: title,
      duration: duration,
      position: position,
      showCloseButton: false,
    );
  }
}
