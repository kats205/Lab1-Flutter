import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/toast_helper.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

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
                  'Check Your Email',
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
                  'We have sent the reset password to the email address brandonelouis@gmail.com',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.openSans(
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
                      Icons.mark_email_unread_rounded,
                      size: 90,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              AuthButton(
                label: 'Open Your Email',
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.successfully,
                ),
              ),
              const SizedBox(height: 16),
              AuthButton(
                label: 'Back to Login',
                backgroundColor: AppTheme.palePurple,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.login),
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () =>
                      showAppToast(context, 'Reset link has been resent!'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'You have not received the email? ',
                          style: AppTextStyles.openSans(
                            fontSize: 12,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ),
                      Text(
                        'Resend',
                        style: AppTextStyles.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
