part of '../view/splash_screen_view.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key, this.onStart});

  final void Function(VoidCallback start)? onStart;

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    widget.onStart?.call(_startAnimation);
  }

  void _startAnimation() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 2),
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
