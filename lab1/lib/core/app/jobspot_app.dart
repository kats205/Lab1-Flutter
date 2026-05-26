import 'package:flutter/material.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';

class JobspotApp extends StatelessWidget {
  const JobspotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobspot App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
