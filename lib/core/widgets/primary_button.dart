import 'package:emaar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onParsed,
    this.borderRadius,
    required this.text,
    this.textStyle,
  });

  final VoidCallback onParsed;
  final double? borderRadius;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onParsed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          // gradient: LinearGradient(
          //   colors: [
          //     AppColors.primary10,
          //     AppColors.primary,
          //     AppColors.primary10,
          //   ],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
