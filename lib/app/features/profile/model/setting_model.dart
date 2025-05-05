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
