import 'dart:async';
import 'package:flutter/material.dart';

class ResendOtpButton extends StatefulWidget {
  final VoidCallback onResend;
  final int cooldownSeconds;
  final String resendText;
  final Color? activeColor;
  final Color? disabledColor;

  const ResendOtpButton({
    super.key,
    required this.onResend,
    this.cooldownSeconds = 30,
    this.resendText = "Resend OTP",
    this.activeColor,
    this.disabledColor,
  });

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  int _remainingSeconds = 0;
  Timer? _timer;

  void _startCooldown() {
    setState(() => _remainingSeconds = widget.cooldownSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _onPressed() {
    if (_remainingSeconds == 0) {
      widget.onResend();
      _startCooldown();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = _remainingSeconds > 0;

    return TextButton(
      onPressed: isDisabled ? null : _onPressed,
      child: Text(
        isDisabled
            ? "${widget.resendText} ($_remainingSeconds s)"
            : widget.resendText,
      ),
    );
  }
}
