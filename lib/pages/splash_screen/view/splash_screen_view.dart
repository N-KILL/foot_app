import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part '../animations/ball_animation.dart';
part '../animations/continue_text.dart';
part '../animations/logo_animation.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BallAnimation(),
    );
  }
}
