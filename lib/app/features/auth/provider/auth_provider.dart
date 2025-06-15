import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/shared_pref.dart';
import 'package:suprapp/app/core/constants/static_data.dart';
import 'package:suprapp/app/features/auth/model/user_model.dart';
import 'package:suprapp/app/features/auth/provider/phone_input_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../routes/go_router.dart';

class AuthProviders extends ChangeNotifier {
  final String accountSid = 'ACa4f84bbe4ca9bce244aa20e45634a404';
  final String authToken = '915ffe3035342b6c68b2ee100f4f9788';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
    final generatedOtp = _generateOtp();
    _otp = generatedOtp;

    const String from = 'whatsapp:+14155238886';
    final Uri uri = Uri.parse(
      'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json',
    );

    final String message = 'Your SuprApp verification code is: $generatedOtp';

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
        GoRouter.of(context).pushNamed(AppRoute.verifyPhoneAuthPage);
      } else {
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
    String? email, // <-- added optional email
  }) async {
    try {
      context.loaderOverlay.show();

      final uid = Uuid();
      final userId = uid.v4();

      final user = UserModel(
        name: name,
        phone: _phone,
        userid: userId,
        createdAt: DateTime.now(),
        email: email ?? '',
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .set(user.toMap());
      StaticData.model = user;
      context.loaderOverlay.hide();
      await SharedPrefs.setLoggedIn(true, user.userid);
      await SharedPrefs.saveUserProfile(user.toMap());

      context.pushNamed(AppRoute.homePage);
    } catch (e) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save user: $e")),
      );
    }
  }

  Future<void> updateDobAndGender({
    required BuildContext context,
    required String dob,
    required String gender,
    required String email,
    required String phoneNo,
    required String name,
  }) async {
    try {
      context.loaderOverlay.show();
      final user = StaticData.model;
      if (user == null) throw "User not found";
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.userid)
          .update({
        'dateOfBirth': dob,
        'gender': gender,
        'email': email,
        'phone': phoneNo,
        'name': name,
      });

      // Update local UserModel
      final updatedUser = user.copyWith(
          dateOfBirth: dob,
          gender: gender,
          email: email,
          phone: phoneNo,
          name: name);

      await SharedPrefs.saveUserProfile(updatedUser.toMap());

      // Also update your StaticData if you're using it for current user state
      StaticData.model = updatedUser;

      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    } catch (e) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile: $e")),
      );
    }
  }

  Future<void> logoutUser() async {
    await SharedPrefs.clear();
    await _firebaseAuth.signOut();
  }

  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     if (googleUser == null) {
  //       return null;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print('Google Sign-In Error: $e');
  //     return null;
  //   }
  // }

  Future<UserModel?> signInWithGoogleAndSaveUser(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? firebaseUser = authResult.user;

      if (firebaseUser != null) {
        await saveUserToFirestore(
          context,
          name: firebaseUser.displayName ?? '',
          email: firebaseUser.email,
        );

        return UserModel(
          name: firebaseUser.displayName ?? '',
          userid: firebaseUser.uid,
          email: firebaseUser.email,
          dateOfBirth: '',
          gender: '',
          phone: firebaseUser.phoneNumber ?? '',
        );
      }

      return null;
    } catch (e) {
      print('Sign-In Error: $e');
      return null;
    }
  }
}
