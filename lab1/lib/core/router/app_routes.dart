import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/check_email_screen.dart';
import '../../features/auth/presentation/pages/forgot_password_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/successfully_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String checkEmail = '/check-email';
  static const String successfully = '/successfully';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (_) => const SplashScreen(),
      login: (_) => const LoginScreen(),
      signUp: (_) => const SignUpScreen(),
      forgotPassword: (_) => const ForgotPasswordScreen(),
      checkEmail: (_) => const CheckEmailScreen(),
      successfully: (_) => const SuccessfullyScreen(),
    };
  }
}
