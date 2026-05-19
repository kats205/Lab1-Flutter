import 'package:flutter/material.dart';

import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.labelUsesOpenSans = false,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool labelUsesOpenSans;

  @override
  Widget build(BuildContext context) {
    final labelStyle = labelUsesOpenSans
        ? AppTextStyles.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textDark,
          )
        : AppTextStyles.dmSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: '•',
          style: AppTextStyles.dmSans(
            fontSize: 14,
            color: AppTheme.textDark,
            letterSpacing: obscureText ? 4.0 : 0.0,
          ),
          decoration: InputDecoration(
            hintText: obscureText ? '••••••••' : hintText,
            hintStyle: AppTextStyles.dmSans(
              color: AppTheme.textHint,
              fontSize: 14,
              letterSpacing: obscureText ? 4.0 : 0.0,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
