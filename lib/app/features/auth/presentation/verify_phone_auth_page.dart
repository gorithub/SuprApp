// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/auth/provider/otp_provider.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class VerifyPhoneAuthPage extends StatefulWidget {
  const VerifyPhoneAuthPage({super.key});

  @override
  State<VerifyPhoneAuthPage> createState() => _VerifyPhoneAuthPageState();
}

class _VerifyPhoneAuthPageState extends State<VerifyPhoneAuthPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _handleChange(BuildContext context, String value, int index) {
    final provider = Provider.of<OTPProvider>(context, listen: false);
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      provider.moveFocus(index, true);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      provider.moveFocus(index, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OTPProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appGrey),
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.darkGrey,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ClipRRect(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              height: 50,
              width: 300,
              text: 'Continue',
              onPressed: () {
                bool isOtpEmpty =
                    _controllers.any((controller) => controller.text.isEmpty);

                if (isOtpEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter OTP"),
                      backgroundColor: colorScheme(context).error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  return;
                }
                context.pushNamed(AppRoute.bioMetricSetupPage);
              },
            ),
          ],
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify your mobile number',
              style: textTheme(context).headlineMedium?.copyWith(
                  color: colorScheme(context).onSurface,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You wil recieve a SMS with verification pin on +93143523154',
              style: textTheme(context).titleSmall?.copyWith(
                  color: AppColors.darkTextGrey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: provider.currentField == index
                            ? Colors.black
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (val) => _handleChange(context, val, index),
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            provider.secondsRemaining > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Resend code ${provider.formattedTime}",
                        style: textTheme(context).headlineSmall?.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive the code? Resend code via",
                            style: textTheme(context).titleSmall?.copyWith(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              _controllers.forEach((c) => c.clear());
                              _focusNodes[0].requestFocus();
                              provider.reset();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 60),
                              backgroundColor: colorScheme(context).primary,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              "Call",
                              style: textTheme(context).titleSmall?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () {
                              _controllers.forEach((c) => c.clear());
                              _focusNodes[0].requestFocus();
                              provider.reset();
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 60),
                            ),
                            child: Text(
                              "SMS",
                              style: textTheme(context).titleSmall?.copyWith(
                                  color: colorScheme(context).onSurface,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
