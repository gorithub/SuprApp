import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/routes/go_router.dart';

class SettingItem {
  final String title;
  final String routeName;

  SettingItem({
    required this.title,
    required this.routeName,
  });
}

final List<SettingItem> settingItems = [
  SettingItem(title: 'Change Password', routeName: AppRoute.changePasswordPage),
  SettingItem(title: 'Change Language', routeName: AppRoute.languagePage),
  SettingItem(title: 'Contact Us', routeName: AppRoute.contactpage),
  SettingItem(title: 'Account Delete', routeName: AppRoute.deleteAccountPage),
];

final List<Map<String, dynamic>> settingsOptions = [
  {
    'title': 'Account & Security',
    'onTap': (BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Navigating to Account & Security')),
      );
    },
  },
  {
    'title': 'Bank Account',
    'onTap': (BuildContext context) {
      context.pushNamed(AppRoute.bankpage);
    },
  },
  {
    'title': 'Add Bank Account',
    'onTap': (BuildContext context) {
      context.pushNamed(AppRoute.addBankPage);
    },
  },
];
