import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/profile/widgets/custom_date_picker_bottom_sheet.dart';
import 'package:suprapp/app/features/profile/widgets/custom_gender_bottom_sheet.dart';
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

class ProfileModel {
  final String name;
  final String yourName;
  final String? routename;
  final void Function(BuildContext context)? showBottomSheet;

  ProfileModel({
    required this.name,
    required this.yourName,
    this.routename,
    this.showBottomSheet,
  });
}

List<ProfileModel> myprofile = [
  ProfileModel(
      name: "Name", yourName: "Shahid", routename: AppRoute.updateNamePage),
  ProfileModel(
      name: "Phone Number",
      yourName: "09876578",
      routename: AppRoute.updatePhonPage),
  ProfileModel(
      name: "Email",
      yourName: "s@gmail.com",
      routename: AppRoute.updateemailPage),
  ProfileModel(
    name: "Gender",
    yourName: "Mail",
    showBottomSheet: (context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => const GenderBottomSheet(),
      );
    },
  ),
  ProfileModel(
    name: "Date of Birth",
    yourName: "12/05/2000",
    showBottomSheet: (context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => const DateOfBirthBottomSheet(),
      );
    },
  ),
];
