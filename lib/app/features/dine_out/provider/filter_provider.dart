import 'package:flutter/material.dart';

class FilterProviders with ChangeNotifier {
  int selectedSortIndex = 0;
  bool isOffersSelected = false;
  final Set<String> selectedQuickFilters = {};
  void selectSort(int index) {
    selectedSortIndex = index;
    notifyListeners();
  }

  void toggleOffers() {
    isOffersSelected = !isOffersSelected;
    notifyListeners();
  }

  void toggleQuickFilter(String filterName) {
    if (selectedQuickFilters.contains(filterName)) {
      selectedQuickFilters.remove(filterName);
    } else {
      selectedQuickFilters.add(filterName);
    }
    notifyListeners();
  }

  void clearAll() {
    selectedSortIndex = 0;
    isOffersSelected = false;
    selectedQuickFilters.clear();
    notifyListeners();
  }

  bool get isAnythingSelected =>
      selectedSortIndex != 0 || isOffersSelected == true;
  bool isQuickFilterSelected(String filterName) =>
      selectedQuickFilters.contains(filterName);
}
