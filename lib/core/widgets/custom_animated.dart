import 'package:flutter/material.dart';

class CustomAnimated extends StatelessWidget {
  final Widget child;
  // final Duration? duration;
  final bool isFromUp;

  const CustomAnimated({super.key, required this.child, this.isFromUp = false});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(
        begin:
            isFromUp
                ? const Offset(0, -1)
                : const Offset(0, 1), // Start from above
        end: Offset.zero,
      ),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(0, offset.dy * 40), // Move up by 40 pixels
          child: Opacity(
            opacity: (1 - offset.dy).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
