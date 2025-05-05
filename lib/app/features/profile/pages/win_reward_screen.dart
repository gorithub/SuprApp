import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: Text('Help Centre',
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Arief!',
                style: textTheme(context).headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'What can I help you for today?',
                style: textTheme(context).titleMedium,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                  controller: controller, hint: "Search for help"),
              const SizedBox(height: 12),
              Text(
                'You can search some keywords from your problem for faster solution you might have.',
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                'Frequently Asked',
                style: textTheme(context)
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // FAQ cards
              _buildFAQCard(
                  'How do I create an account?',
                  'You can create a Smartpay account by: download and open the smartpay application first then select ...',
                  context),
              const SizedBox(height: 16),
              _buildFAQCard(
                  'How to create a card for transactions?',
                  'You can select the create card menu then select "Add New Card" select the continue button then you ...',
                  context),
              const SizedBox(height: 16),
              _buildFAQCard(
                  'How to Top Up on this App?',
                  'Click the Top Up menu then select the amount of money and the method then click the "top up now" button...',
                  context),
              const SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomElevatedButton(
                      text: "Submit Appeal", onPressed: () {})),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQCard(
    String title,
    String content,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme(context)
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: textTheme(context)
                .bodyLarge
                ?.copyWith(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
