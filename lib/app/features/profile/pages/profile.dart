import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';

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
                _buildSettingItem('Cards and accounts', onTap: () {}),
                _buildSettingItem('Saved addresses', onTap: () {}),
                _buildSettingItem('Notifications', onTap: () {}),
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
                      color: Color(0xff018D14),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'S+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: 'See the benefits',
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 24),
              _buildSection('Support', [
                _buildSettingItem(
                  'Help Center',
                  onTap: () {},
                ),
                _buildSettingItem(
                  'Invite Friends',
                  onTap: () {},
                ),
                _buildSettingItem(
                  'Win Rewards',
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 24),
              _buildSection('Preferences', [
                _buildSettingItem(
                  'Language',
                  subtitle: 'English',
                  onTap: () {},
                ),
                _buildSettingItem(
                  'Country',
                  subtitle: 'United States of America',
                  onTap: () {},
                ),
                _buildSettingItem(
                  'Settings',
                  onTap: () {},
                ),
                _buildSettingItem(
                  'Account Setting',
                  onTap: () {},
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            )
          : null,
      leading: leading,
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: onTap,
    );
  }

  Widget _buildSuprPlusCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF018D14), Color(0xFF002706)],
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
                        color: colorScheme(context).primary,
                        fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Tap for instant help',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Get more with Supr',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'See the benefits',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Save ₹1000+ per month\nStart Supr Plus Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff00241E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'See the Benefits',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
