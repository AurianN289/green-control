import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomButton - A reusable button component with customizable styling
 * 
 * @param text - The text to display on the button
 * @param onPressed - Callback function when button is pressed
 * @param backgroundColor - Background color of the button
 * @param textColor - Color of the button text
 * @param height - Height of the button
 * @param width - Width of the button (defaults to full width)
 * @param borderRadius - Border radius of the button corners
 * @param fontSize - Font size of the button text
 * @param fontWeight - Font weight of the button text
 * @param isEnabled - Whether the button is enabled or disabled
 */
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.isEnabled = true,
  }) : super(key: key);

  /// Text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the button text
  final Color? textColor;

  /// Height of the button
  final double? height;

  /// Width of the button
  final double? width;

  /// Border radius of the button corners
  final double? borderRadius;

  /// Font size of the button text
  final double? fontSize;

  /// Font weight of the button text
  final FontWeight? fontWeight;

  /// Whether the button is enabled or disabled
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 42.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? appTheme.colorFF57B4,
          disabledBackgroundColor: backgroundColor?.withAlpha(128) ??
              appTheme.colorFF57B4.withAlpha(128),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
          ),
          elevation: 0,
          shadowColor: appTheme.transparentCustom,
        ),
        child: Text(
          text,
          style: TextStyleHelper.instance.bodyTextInter
              .copyWith(color: textColor ?? appTheme.whiteCustom),
        ),
      ),
    );
  }
}
