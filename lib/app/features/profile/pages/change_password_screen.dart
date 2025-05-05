import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/controller/profile_controller.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileController = context.watch<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: Text('Change Password',
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
              hint: "Old Password",
              obscureText: profileController.isVisible("Old Password"),
              hintColor: Colors.grey,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: oldPasswordController,
              focusBorderColor: AppColors.appGrey,
              suffixIcon: IconButton(
                icon: Icon(
                  profileController.isVisible("Old Password")
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    profileController.toggleVisibility("Old Password"),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hint: "New Password",
              obscureText: profileController.isVisible("New Password"),
              hintColor: Colors.grey,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: newPasswordController,
              focusBorderColor: AppColors.appGrey,
              suffixIcon: IconButton(
                icon: Icon(
                  profileController.isVisible("New Password")
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    profileController.toggleVisibility("New Password"),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hint: "Confirm Password",
              obscureText: profileController.isVisible("Confirm Password"),
              hintColor: Colors.grey,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: confirmPasswordController,
              focusBorderColor: AppColors.appGrey,
              suffixIcon: IconButton(
                icon: Icon(
                  profileController.isVisible("Confirm Password")
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    profileController.toggleVisibility("Confirm Password"),
              ),
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(text: "Save", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
