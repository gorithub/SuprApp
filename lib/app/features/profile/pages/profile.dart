import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/routes/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme(context).onPrimary,
          automaticallyImplyLeading: false,
          leading: const CustomArrowBack()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text("Khani",
                  style: textTheme(context)
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildSuprPlusCard(),
              const SizedBox(height: 24),
              _buildSection('Your account', [
                _buildSettingItem(
                  'Personal Information',
                  subtitle: "+914567893 ",
                  onTap: () {},
                ),
                _buildSettingItem('Cards and accounts', onTap: () {
                  context.pushNamed(AppRoute.bankpage);
                }),
                _buildSettingItem('Saved addresses', onTap: () {}),
                _buildSettingItem('Notifications', onTap: () {
                  context.pushNamed(AppRoute.notificationpage);
                }),
                _buildSettingItem('Manage Business profile', onTap: () {}),
              ]),
              const SizedBox(height: 24),
              _buildSection('Benefits', [
                _buildSettingItem(
                  'Supr Plus',
                  leading: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('S+',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: colorScheme(context).onPrimary)),
                  ),
                  subtitle: 'See the benefits',
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 24),
              _buildSection('Support', [
                _buildSettingItem(
                  'Help Center',
                  onTap: () {
                    context.pushNamed(AppRoute.helpcenter);
                  },
                ),
                _buildSettingItem(
                  'Invite Friends',
                  onTap: () {
                    context.pushNamed(AppRoute.invitePage);
                  },
                ),
                _buildSettingItem(
                  'Win Rewards',
                  onTap: () {
                    context.pushNamed(AppRoute.winRewardPage);
                  },
                ),
              ]),
              const SizedBox(height: 24),
              _buildSection('Preferences', [
                _buildSettingItem(
                  'Language',
                  subtitle: 'English',
                  onTap: () {
                    context.pushNamed(AppRoute.languagePage);
                  },
                ),
                _buildSettingItem(
                  'Country',
                  subtitle: 'United States of America',
                  onTap: () {
                    context.pushNamed(AppRoute.selectcCountryPage);
                  },
                ),
                _buildSettingItem(
                  'Settings',
                  onTap: () {
                    context.pushNamed(AppRoute.settingPage);
                  },
                ),
                _buildSettingItem(
                  'Account Setting',
                  onTap: () {
                    context.pushNamed(AppRoute.accountSettingPage);
                  },
                ),
              ]),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms And Conditions',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme(context)
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildSettingItem(
    String title, {
    String? subtitle,
    Widget? leading,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      title: Text(
        title,
        style: textTheme(context)
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null
          ? Text(subtitle,
              style: textTheme(context).bodyMedium?.copyWith(
                  color: colorScheme(context).onSurface.withOpacity(0.3)))
          : null,
      leading: leading,
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: onTap,
    );
  }

  Widget _buildSuprPlusCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme(context).primary,
            colorScheme(context).onSurface.withOpacity(0.85)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Supr+',
                    style: textTheme(context).titleLarge?.copyWith(
                        color: AppColors.colorGreen,
                        fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme(context).onPrimary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Tap for instant help',
                      style: textTheme(context)
                          .bodySmall
                          ?.copyWith(color: colorScheme(context).onPrimary)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text('Get more with Supr',
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onPrimary)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('See the benefits',
                        style: textTheme(context).titleSmall?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      'Save ₹1000+ per month\nStart Supr Plus Now',
                      style: textTheme(context)
                          .bodySmall
                          ?.copyWith(color: colorScheme(context).onPrimary),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme(context).onSurface.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('See the Benefits',
                      style: textTheme(context).bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme(context).onPrimary)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
