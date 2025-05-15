// ignore_for_file: use_build_context_synchronously, unnecessary_const

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/get_started/widgets/auth_selection_sheet.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset(AppVideos.goVideo);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
        });
      });
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
            const Align(
              alignment: Alignment.bottomCenter,
              child: const AuthSelectionSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
