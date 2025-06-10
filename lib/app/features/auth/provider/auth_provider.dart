import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/static_data.dart';
import 'package:suprapp/app/features/auth/model/user_model.dart';
import 'package:suprapp/app/features/auth/provider/phone_input_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../routes/go_router.dart';

class AuthProvider extends ChangeNotifier {
  final String accountSid = 'ACa4f84bbe4ca9bce244aa20e45634a404';
  final String authToken = '915ffe3035342b6c68b2ee100f4f9788';
  String? _phone;

  String? get phone => _phone;

  String? _otp;

  // Optionally store generated OTP for verification
  String? get otp => _otp;

  Future<void> sendWhatsAppOtp(BuildContext context) async {
    final phoneProvider =
        Provider.of<PhoneInputProvider>(context, listen: false);

    final String fullPhone = phoneProvider.countryCode + phoneProvider.phone;
    _phone = fullPhone;
    // ✅ 1. Generate a 6-digit OTP
    final generatedOtp = _generateOtp();
    _otp = generatedOtp;

    const String from = 'whatsapp:+14155238886'; // Twilio Sandbox sender

    final Uri uri = Uri.parse(
      'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json',
    );

    // ✅ 3. Create the message
    final String message = 'Your SuprApp verification code is: $generatedOtp';

    // ✅ 4. Send the request
    try {
      final response = await http.post(
        uri,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'From': from,
          'To': 'whatsapp:$_phone',
          'Body': message,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // ✅ OTP sent successfully
        GoRouter.of(context).pushNamed(AppRoute.verifyPhoneAuthPage);
      } else {
        // ❌ Failed
        _showError(context, 'Failed to send OTP. Code: ${response.statusCode}');
      }
    } catch (e) {
      _showError(context, 'Error sending OTP: $e');
    }
  }

  String _generateOtp() {
    final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000);
    return random.toString().padLeft(6, '0');
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Future<void> saveUserToFirestore(
    BuildContext context, {
    required String name,
  }) async {
    try {
      context.loaderOverlay.show();

      final uid = Uuid();
      final userId = uid.v4();

      final user = UserModel(name: name, phone: _phone, userid: userId);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .set(user.toMap());
      StaticData.model = user;
      context.loaderOverlay.hide();
      context.goNamed(AppRoute.homePage);
    } catch (e) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save user: $e")),
      );
    }
  }
}
