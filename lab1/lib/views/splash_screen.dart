import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../apps/app_routes.dart';
import '../apps/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
    _navigationTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: FadeTransition(opacity: _fadeAnimation, child: child),
            );
          },
          child: SvgPicture.asset(
            'assets/images/svg/Group 64.svg',
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}
