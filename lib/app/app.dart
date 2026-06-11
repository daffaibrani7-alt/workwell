import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../features/auth/screens/login_screen.dart';
import 'routes.dart';

class WorkwellApp extends StatelessWidget {
  const WorkwellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkWell BPHN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      routes: AppRoutes.routes,
      home: const LoginScreen(),
    );
  }
}