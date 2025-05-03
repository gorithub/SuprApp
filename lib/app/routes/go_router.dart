import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:suprapp/app/routes/error_route.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.spalshScreen}',
    routes: [
      // GoRoute(
      //   name: AppRoute.bottomNavBar,
      //   path: '/${AppRoute.bottomNavBar}',
      //   pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
      //     context: context,
      //     state: state,
      //     child: const CustomBottomNavBar(),
      //   ),
      // ),
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
  static const String spalshScreen = 'splash-page';
  static const String bottomNavBar = 'bottom-nav-bar';

  // auth
  static const String loginPage = 'login-page';
  static const String registerPage = 'register-page';

  static const String recipeDetailPage = 'recipe-detail-page';
}
