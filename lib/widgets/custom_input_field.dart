import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_export.dart';

/**
 * CustomInputField - A reusable input field component with customizable styling and validation
 * 
 * Supports various input types including email, password, text with configurable
 * placeholder, validation, and styling options. Provides consistent design
 * with focus states and error handling.
 * 
 * @param controller - TextEditingController for managing input text
 * @param placeholder - Placeholder text displayed when field is empty
 * @param inputType - Keyboard type for the input field
 * @param isRequired - Whether the field is required for validation
 * @param validator - Custom validation function
 * @param isPassword - Whether to obscure text input
 * @param enabled - Whether the input field is enabled
 * @param maxLines - Maximum number of lines for multiline input
 * @param inputFormatters - List of input formatters to restrict input
 * @param onChanged - Callback function when text changes
 * @param onSubmitted - Callback function when field is submitted
 * @param prefixIcon - Widget to display before the input text
 * @param suffixIcon - Widget to display after the input text
 */
class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.controller,
    this.placeholder,
    this.inputType,
    this.isRequired,
    this.validator,
    this.isPassword,
    this.enabled,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  /// Controller for managing the input text
  final TextEditingController? controller;

  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Keyboard type for the input field
  final TextInputType? inputType;

  /// Whether the field is required for validation
  final bool? isRequired;

  /// Custom validation function
  final String? Function(String?)? validator;

  /// Whether to obscure the text (for passwords)
  final bool? isPassword;

  /// Whether the input field is enabled
  final bool? enabled;

  /// Maximum number of lines for the input
  final int? maxLines;

  /// List of input formatters to restrict input
  final List<TextInputFormatter>? inputFormatters;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Callback when field is submitted
  final Function(String)? onSubmitted;

  /// Widget to display before the input text
  final Widget? prefixIcon;

  /// Widget to display after the input text
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: isPassword ?? false,
      enabled: enabled ?? true,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator ?? (isRequired == true ? _defaultValidator : null),
      style: TextStyleHelper.instance.body15Regular.copyWith(height: 1.27),
      decoration: InputDecoration(
        hintText: placeholder ?? "Enter text",
        hintStyle:
            TextStyleHelper.instance.body15Regular.copyWith(height: 1.27),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 12.h,
        ),
        filled: true,
        fillColor: appTheme.whiteCustom,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.colorFFCCCC,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.colorFFCCCC,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.colorFF2F7D,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.redCustom,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.redCustom,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            // Modified: Removed const for dynamic theme color
            color: appTheme.colorFFE0E0,
            width: 1,
          ),
        ),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
