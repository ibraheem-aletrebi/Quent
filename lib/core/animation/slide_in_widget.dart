import 'package:flutter/material.dart';

class SlideInWidget extends StatefulWidget {
  const SlideInWidget({
    super.key,
    required this.child,
    this.direction = const Offset(0, -0.5),
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeOut,
  });

  final Widget child;
  final Offset direction;
  final Duration duration;
  final Curve curve;

  @override
  State<SlideInWidget> createState() => _SlideInWidgetState();
}

class _SlideInWidgetState extends State<SlideInWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _slideAnimation = Tween<Offset>(
      begin: widget.direction,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slideAnimation, child: widget.child);
  }
}
