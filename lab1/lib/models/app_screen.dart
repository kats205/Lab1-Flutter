import '../apps/app_routes.dart';

enum AppScreen {
  splash('1. Splash Screen', AppRoutes.splash),
  login('2. Login', AppRoutes.login),
  signUp('3. Sign Up', AppRoutes.signUp),
  forgotPassword('4. Forgot Password', AppRoutes.forgotPassword),
  checkEmail('5. Check Email', AppRoutes.checkEmail),
  successfully('6. Successfully', AppRoutes.successfully);

  const AppScreen(this.label, this.routeName);

  final String label;
  final String routeName;
}
