import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class UpdateEmai extends StatelessWidget {
  const UpdateEmai({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Update your email",
              style: textTheme(context)
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Recieve information about new updates and awespme promos in your inbox",
              style: textTheme(context).bodySmall,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hint: "Enter your email",
              controller: controller,
              focusBorderColor: AppColors.appGrey,
              hintColor: AppColors.appGrey,
              fillColor: colorScheme(context).onPrimary,
              contentPadding: const EdgeInsets.all(16),
            ),
            const Spacer(),
            CustomElevatedButton(text: "Update", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
