import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class UpdatePhoneNo extends StatelessWidget {
  const UpdatePhoneNo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Update your mobile number",
              style: textTheme(context)
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "We will send a code to your new mobile number to veryfy your account ",
              style: textTheme(context).bodySmall,
            ),
            const SizedBox(height: 10),
            IntlPhoneField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.appGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: AppColors.appGrey)),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {},
            ),
            const Spacer(),
            CustomElevatedButton(text: "Update", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
