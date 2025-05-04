import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/profile/pages/profile.dart';
import 'package:suprapp/app/routes/error_route.dart';
import 'package:suprapp/app/routes/route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.profilePage}',
    routes: [
      GoRoute(
        name: AppRoute.profilePage,
        path: '/${AppRoute.profilePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ProfileScreen(),
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
  //!---- profile Section---- !//
  static const String profilePage = 'profile';
}
