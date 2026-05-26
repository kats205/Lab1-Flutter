import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class AppTheme {
  static const Color primary = Color(0xff130160);
  static const Color secondary = Color(0xffFF9228);
  static const Color background = Color(0xffF9F9F9);
  static const Color textDark = Color(0xff0D0140);
  static const Color textMuted = Color(0xff524B6B);
  static const Color textHint = Color(0xffAAA6B9);
  static const Color border = Color(0xffE3E0E9);
  static const Color palePurple = Color(0xffD6CDFE);

  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: background,
      ),
      useMaterial3: true,
      fontFamily: AppTextStyles.dmSansFamily,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: AppTextStyles.dmSansFamily),
        bodyMedium: TextStyle(fontFamily: AppTextStyles.dmSansFamily),
        bodySmall: TextStyle(fontFamily: AppTextStyles.dmSansFamily),
      ),
    );
  }
}
