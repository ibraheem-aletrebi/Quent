import 'package:flutter/material.dart';

class RotateAnimation extends StatelessWidget {
  const RotateAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        final curvedAnim = CurvedAnimation(parent: animation, curve: curve);
        return RotationTransition(
          turns: Tween<double>(begin: begin, end: end).animate(curvedAnim),
          child: FadeTransition(opacity: curvedAnim, child: child),
        );
      },
      child: child,
    );
  }
}
