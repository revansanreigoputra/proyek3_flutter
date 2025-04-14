import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyek3_flutter/core/constants/colors.dart';
import 'package:proyek3_flutter/core/extensions/build_context_ext.dart';
import 'package:proyek3_flutter/data/datasources/auth_local_datasource.dart';
import 'package:proyek3_flutter/presentation/auth/pages/login_page.dart';
import 'package:proyek3_flutter/presentation/home/pages/home_page.dart';
import 'package:proyek3_flutter/presentation/partner/home/pages/home_partner_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    bool isAuthenticated = await AuthLocalDatasource().isAuthDataExists();

    log("isAuthenticated: $isAuthenticated");
    await Future.delayed(const Duration(seconds: 3));
    if (isAuthenticated) {
      final model = await AuthLocalDatasource().getAuthData();
      if (model.data!.user?.isVendor == 1) {
        context.pushReplacement(const HomePartnerPage());
      } else {
        context.pushReplacement(const HomePage());
      }
    } else {
      context.push(const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          width: 320,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
