import 'dart:math';
import 'package:flutter/material.dart';

class GlowingDotWidget extends StatefulWidget {
  const GlowingDotWidget({
    super.key,
    required this.color,
    this.size = 20,
    this.duration = const Duration(seconds: 2),
  });

  final Color color;
  final double size;
  final Duration duration;

  @override
  State<GlowingDotWidget> createState() => _GlowingDotWidgetState();
}

class _GlowingDotWidgetState extends State<GlowingDotWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = 1 + 0.2 * sin(_controller.value * 2 * pi);
        final blur = 15 + 10 * sin(_controller.value * 2 * pi);

        return Transform.scale(
          scale: scale,
          child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: .4),
                  blurRadius: blur,
                  spreadRadius: blur,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
