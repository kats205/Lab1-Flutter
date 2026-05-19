import 'package:flutter/material.dart';

import '../apps/app_assets.dart';
import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xffF4F4F4),
    this.textColor = AppTheme.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleIcon, height: 20, width: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStyles.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
