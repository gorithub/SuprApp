import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final double borderWidth;
  final VoidCallback onPressed;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding; // Custom padding

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.buttonColor,
    this.borderColor,
    this.textStyle,
    this.borderRadius = 10.0,
    this.borderWidth = 8.0,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.padding, // Accept padding parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Default to full width if not provided
      height: height ?? 50, // Default to 50 if height is not provided
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor ?? colorScheme(context).primary,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth,
              ),
            ),
          ),
          padding: MaterialStateProperty.all(
            padding ?? EdgeInsets.all(12),
          ), // Default padding if not provided
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize ?? 20,
                color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle ??
                  textTheme(context).titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
