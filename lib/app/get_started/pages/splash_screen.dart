// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/get_started/widgets/auth_selection_sheet.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;

  void _openSelectAddressSheet() async {
    await Future.delayed(const Duration(seconds: 2));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AuthSelectionSheet(),
    );
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset(AppVideos.splashVideo);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
        });
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openSelectAddressSheet();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  _getVideoBackground() {
    return VideoPlayer(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}
