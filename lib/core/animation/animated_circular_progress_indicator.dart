import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  const AnimatedCircularProgressIndicator({
    super.key,
    required this.value,
    this.size = 40.0,
    this.strokeWidth = 3.0,
    this.color,
    this.backgroundColor,
    this.duration = const Duration(milliseconds: 800),
  });

  final double value;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final Duration duration;

  @override
  State<AnimatedCircularProgressIndicator> createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends State<AnimatedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _previousValue = 0.0;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value.clamp(0.0, 1.0);
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = AlwaysStoppedAnimation(_previousValue);
  }

  @override
  void didUpdateWidget(covariant AnimatedCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value == widget.value) return;
    final newValue = widget.value.clamp(0.0, 1.0);
    _animation = Tween<double>(
      begin: _previousValue,
      end: newValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward(from: 0);
    _previousValue = newValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CircularProgressIndicator(
            value: _animation.value,
            strokeWidth: widget.strokeWidth,
            color: widget.color ?? Theme.of(context).primaryColor,
            backgroundColor: widget.backgroundColor ?? Colors.transparent,
          );
        },
      ),
    );
  }
}
