import 'package:flutter/material.dart';

import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';

class AuthSwitchLink extends StatelessWidget {
  const AuthSwitchLink({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.openSans(
              fontSize: 12,
              color: AppTheme.textMuted,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.openSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.secondary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
