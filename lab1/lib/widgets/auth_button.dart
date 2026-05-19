import 'package:flutter/material.dart';

import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppTheme.primary,
    this.foregroundColor = Colors.white,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: AppTextStyles.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
