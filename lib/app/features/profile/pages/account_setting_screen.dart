import 'package:flutter/material.dart';
import 'package:suprapp/app/features/profile/pages/add_bank_screen.dart';
import 'package:suprapp/app/features/profile/pages/bank_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.chevron_left, color: Color(0xff007438)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text(
          'Account Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Account Section Title
            const Text(
              'My Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Account & Security Option
            _buildSettingOption(
              context: context,
              title: 'Account & Security',
              onTap: () {
                // Navigate to Account & Security screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Navigating to Account & Security'),
                  ),
                );
              },
            ),

            // Bank Account Option
            _buildSettingOption(
              context: context,
              title: 'Bank Account',
              onTap: () {
                // Navigate to Bank Account screen

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BankAccountScreen()),
                );
              },
              isLast: true,
            ),
            _buildSettingOption(
              context: context,
              title: 'Add Bank Account',
              onTap: () {
                // Navigate to Account & Security screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddBankAccountScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required BuildContext context,
    required String title,
    required Function() onTap,
    bool isLast = false,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
        if (!isLast) Divider(color: Colors.grey.shade200, height: 1),
      ],
    );
  }
}

// Example usage in main.dart
