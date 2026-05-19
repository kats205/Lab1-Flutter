import 'package:flutter/material.dart';

import '../apps/app_routes.dart';
import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_switch_link.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/remember_me_tile.dart';
import '../widgets/social_auth_button.dart';
import '../widgets/toast_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'Create an Account',
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.dmSans(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                AuthTextField(
                  label: 'Full name',
                  controller: _nameController,
                  hintText: 'Brandone Louis',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'Example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label: 'Password',
                  controller: _passwordController,
                  hintText: '••••••••',
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppTheme.textMuted,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberMeTile(
                      value: _rememberMe,
                      onChanged: () {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPassword,
                      ),
                      child: Text(
                        'Forgot Password ?',
                        style: AppTextStyles.dmSans(
                          fontSize: 12,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                AuthButton(
                  label: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showAppToast(context, 'Account successfully created!');
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                  },
                ),
                const SizedBox(height: 16),
                SocialAuthButton(
                  label: 'Sign up with Google',
                  backgroundColor: AppTheme.palePurple,
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Google integration coming soon!'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                AuthSwitchLink(
                  text: "You don't have an account yet? ",
                  actionText: 'Sign in',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
