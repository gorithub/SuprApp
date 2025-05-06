import 'package:flutter/material.dart';

class GenderProvider extends ChangeNotifier {
  String _selectedGender = 'Male'; // Default

  String get selectedGender => _selectedGender;

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }
}
