import 'package:flutter/material.dart';

import '../views/check_email_screen.dart';
import '../views/forgot_password_screen.dart';
import '../views/login_screen.dart';
import '../views/sign_up_screen.dart';
import '../views/splash_screen.dart';
import '../views/successfully_screen.dart';

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
