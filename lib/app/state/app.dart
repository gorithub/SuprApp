import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/core/theme/app_theme.dart';
import 'package:suprapp/app/features/auth/provider/otp_provider.dart';
import 'package:suprapp/app/features/auth/provider/phone_input_provider.dart';
import 'package:suprapp/app/features/dine_out/controller/dine_out_provider.dart';
import 'package:suprapp/app/features/dine_out/controller/filter_controller.dart';
import 'package:suprapp/app/features/dine_out/provider/faqs_provider.dart';
import 'package:suprapp/app/features/dine_out/provider/filter_provider.dart';
import 'package:suprapp/app/features/dine_out/controller/state_controller.dart';
import 'package:suprapp/app/features/dine_out/provider/view_toggler_provider.dart';
import 'package:suprapp/app/features/profile/controller/bank_controller.dart';
import 'package:suprapp/app/features/profile/controller/date_provider.dart';
import 'package:suprapp/app/features/profile/controller/gender_controller.dart';
import 'package:suprapp/app/features/profile/controller/language_controller.dart';
import 'package:suprapp/app/features/profile/controller/profile_controller.dart';
import 'package:suprapp/app/routes/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneInputProvider()),
        ChangeNotifierProvider(create: (_) => OTPProvider()..startTimer()),
        ChangeNotifierProvider<ProfileController>(
            create: (_) => ProfileController()),
        ChangeNotifierProvider<LanguageController>(
            create: (_) => LanguageController()),
        ChangeNotifierProvider<BankProvider>(create: (_) => BankProvider()),
        ChangeNotifierProvider<GenderProvider>(create: (_) => GenderProvider()),
        ChangeNotifierProvider<DateProvider>(create: (_) => DateProvider()),
        ChangeNotifierProvider<DineOutProvider>(
            create: (_) => DineOutProvider()),
        ChangeNotifierProvider<FilterProvider>(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => FAQProvider()),
        ChangeNotifierProvider(create: (_) => FilterProviders()),
        ChangeNotifierProvider(
          create: (_) => DineOutProvider(),
        ),
        ChangeNotifierProvider<FilterProvider>(
          create: (_) => FilterProvider(),
        ),
        ChangeNotifierProvider<AppBarProvider>(
          create: (_) => AppBarProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ViewToggleProvider()),
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          title: 'Supr App',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          theme: AppTheme.instance.lightTheme,
          routerDelegate: MyAppRouter.router.routerDelegate,
          routeInformationParser: MyAppRouter.router.routeInformationParser,
          routeInformationProvider: MyAppRouter.router.routeInformationProvider,
        ),
      ),
    );
  }
}
