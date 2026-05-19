import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../apps/app_routes.dart';
import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';
import '../widgets/auth_button.dart';

class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Successfully',
                  style: AppTextStyles.dmSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Your password has been updated, please change your password regularly to avoid this happening',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.dmSans(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 160),
                  child: SvgPicture.asset(
                    'assets/images/svg/undraw_message_sent_re_q2kl 1.svg',
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 90,
                      color: AppTheme.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              AuthButton(
                label: 'Continue',
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.login),
              ),
              const SizedBox(height: 16),
              AuthButton(
                label: 'Back to Login',
                backgroundColor: AppTheme.palePurple,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.login),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
