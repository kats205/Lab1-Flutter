import 'package:flutter/material.dart';

import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xffF4F4F4),
    this.textColor = AppTheme.primary,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
         ),
         child: isLoading
             ? SizedBox(
                 height: 20,
                 width: 20,
                 child: CircularProgressIndicator(
                   strokeWidth: 2,
                   valueColor: AlwaysStoppedAnimation<Color>(textColor),
                 ),
               )
             : Row(
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
