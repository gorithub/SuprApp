import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/dine_out/pages/dine_out_page.dart';
import 'package:suprapp/app/features/dine_out/pages/favourite_restaurent_page.dart';
import 'package:suprapp/app/features/profile/pages/account_setting_screen.dart';
import 'package:suprapp/app/features/profile/pages/add_bank_screen.dart';
import 'package:suprapp/app/features/profile/pages/bank_screen.dart';
import 'package:suprapp/app/features/profile/pages/change_password_screen.dart';
import 'package:suprapp/app/features/profile/pages/contact_screen.dart';
import 'package:suprapp/app/features/profile/pages/delete_account_screen.dart';
import 'package:suprapp/app/features/profile/pages/help_center_screen.dart';
import 'package:suprapp/app/features/profile/pages/invite_screen.dart';
import 'package:suprapp/app/features/profile/pages/language_screen.dart';
import 'package:suprapp/app/features/profile/pages/notification_screen.dart';
import 'package:suprapp/app/features/profile/pages/personal_info.dart';
import 'package:suprapp/app/features/profile/pages/profile.dart';
import 'package:suprapp/app/features/profile/pages/select_country_screen.dart';
import 'package:suprapp/app/features/profile/pages/settings_screen.dart';
import 'package:suprapp/app/features/profile/pages/update_email.dart';
import 'package:suprapp/app/features/profile/pages/update_name.dart';
import 'package:suprapp/app/features/profile/pages/update_phone_no.dart';
import 'package:suprapp/app/features/profile/pages/win_reward_screen.dart';
import 'package:suprapp/app/routes/error_route.dart';
import 'package:suprapp/app/routes/route_transition.dart';
import 'package:suprapp/app/features/auth/presentation/biometric_setup_page.dart';
import 'package:suprapp/app/features/auth/presentation/phone_auth_page.dart';
import 'package:suprapp/app/features/auth/presentation/verify_phone_auth_page.dart';
import 'package:suprapp/app/features/home/home.dart';
import 'package:suprapp/app/get_started/pages/splash_screen.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.dineOutPage}',
    routes: [
      GoRoute(
        name: AppRoute.splashScreen,
        path: '/${AppRoute.splashScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SplashPage(),
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
      GoRoute(
          name: AppRoute.profilePage,
          path: '/${AppRoute.profilePage}',
          pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
                context: context,
                state: state,
                child: const ProfileScreen(),
              )),
      GoRoute(
        name: AppRoute.helpcenter,
        path: '/${AppRoute.helpcenter}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HelpCenter(),
        ),
      ),
      GoRoute(
        name: AppRoute.winRewardPage,
        path: '/${AppRoute.winRewardPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WinRewardScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.notificationpage,
        path: '/${AppRoute.notificationpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NotificationSettingsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.invitePage,
        path: '/${AppRoute.invitePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const InviteFriendsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.settingPage,
        path: '/${AppRoute.settingPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ProfileSettingsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.changePasswordPage,
        path: '/${AppRoute.changePasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChangePasswordScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.contactpage,
        path: '/${AppRoute.contactpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ContactUsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.languagePage,
        path: '/${AppRoute.languagePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LanguageScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.deleteAccountPage,
        path: '/${AppRoute.deleteAccountPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DeleteAccountScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.bankpage,
        path: '/${AppRoute.bankpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BankAccountScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.addBankPage,
        path: '/${AppRoute.addBankPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddBankAccountScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.accountSettingPage,
        path: '/${AppRoute.accountSettingPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AccountSettingsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.selectcCountryPage,
        path: '/${AppRoute.selectcCountryPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SelectCountryScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.personalInfo,
        path: '/${AppRoute.personalInfo}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PersonalInfo(),
        ),
      ),
      GoRoute(
        name: AppRoute.updateNamePage,
        path: '/${AppRoute.updateNamePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const UpdateName(),
        ),
      ),
      GoRoute(
        name: AppRoute.updateemailPage,
        path: '/${AppRoute.updateemailPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const UpdateEmai(),
        ),
      ),
      GoRoute(
        name: AppRoute.updatePhonPage,
        path: '/${AppRoute.updatePhonPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const UpdatePhoneNo(),
        ),
      ),
      GoRoute(
        name: AppRoute.dineOutPage,
        path: '/${AppRoute.dineOutPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DineOutPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.favouriteRestaurentPage,
        path: '/${AppRoute.favouriteRestaurentPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FavouriteRestaurentPage(),
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
  //!---- Profile Section---- !//
  static const String profilePage = 'profile';
  static const String helpcenter = 'win-reward-screen';
  static const String winRewardPage = 'help-center-screen';
  static const String notificationpage = 'notification-screen';
  static const String invitePage = 'invite-screen';
  static const String settingPage = 'settings-screen';
  static const String changePasswordPage = 'change-passorsd-screen';
  static const String contactpage = 'contact-screen';
  static const String languagePage = 'language-screen';
  static const String deleteAccountPage = 'delete-account-screen';
  static const String bankpage = 'bank-screen';
  static const String addBankPage = 'add-bank-screen';
  static const String accountSettingPage = 'account-setting-screen';
  static const String selectcCountryPage = 'select-country-screen';
  static const String personalInfo = 'personal-info';
  static const String updateNamePage = 'update-name';
  static const String updateemailPage = 'update-email';
  static const String updatePhonPage = 'update-phone-no';
  static const String splashScreen = 'splash-page';
  static const String homePage = 'home-page';
  //!---- Auth Section---- !//
  static const String phoneAuthPage = 'phone-auth-page';
  static const String verifyPhoneAuthPage = 'verify-phone-auth-page';
  static const String bioMetricSetupPage = 'bio-metric-page';
//!---- DineOut Section---- !//
  static const String dineOutPage = 'dine-out-page';
  static const String favouriteRestaurentPage = 'favourite-restaurent-page';
}
