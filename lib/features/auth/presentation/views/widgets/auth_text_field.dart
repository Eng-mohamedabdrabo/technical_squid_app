import 'package:flutter/material.dart';

import 'package:technical_squid_app/core/utils/color_manager.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.prefix,
    this.focusNode,
  });

  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      // Changed from TextField to TextFormField
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: ColorManager.textDark, // ENSURING DARK TEXT COLOR
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: ColorManager.primary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorManager.textSecondary,
        ), // Readable hint
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: ColorManager.primary)
            : null,
        prefix: prefix,
        filled: true,
        fillColor: Colors.white, // Light background for field
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.primary, width: 1.5),
        ),
      ),
    );
  }
}
