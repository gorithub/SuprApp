import 'dart:async';
import 'package:flutter/material.dart';

class ImageCarouselProvider extends ChangeNotifier {
  final PageController controller = PageController();
  final int imageCount;
  int _currentPage = 0;
  Timer? _timer;

  ImageCarouselProvider(this.imageCount) {
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _currentPage = (_currentPage + 1) % imageCount;
      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
