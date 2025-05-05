import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/auth/presentation/biometric_setup_page.dart';
import 'package:suprapp/app/features/auth/presentation/phone_auth_page.dart';
import 'package:suprapp/app/features/auth/presentation/verify_phone_auth_page.dart';
import 'package:suprapp/app/features/home/home.dart';
import 'package:suprapp/app/routes/error_route.dart';
import 'package:suprapp/app/routes/route_transition.dart';
import 'package:suprapp/app/get_started/pages/splash_screen.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.splashScreen}',
    routes: [
      GoRoute(
        name: AppRoute.splashScreen,
        path: '/${AppRoute.splashScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: SplashPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.phoneAuthPage,
        path: '/${AppRoute.phoneAuthPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PhoneAuthPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.verifyPhoneAuthPage,
        path: '/${AppRoute.verifyPhoneAuthPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const VerifyPhoneAuthPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.bioMetricSetupPage,
        path: '/${AppRoute.bioMetricSetupPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BiometricSetupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.homePage,
        path: '/${AppRoute.homePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String splashScreen = 'splash-page';
  static const String homePage = 'home-page';

  // auth
  static const String phoneAuthPage = 'phone-auth-page';
  static const String verifyPhoneAuthPage = 'verify-phone-auth-page';
  static const String bioMetricSetupPage = 'bio-metric-page';
}
