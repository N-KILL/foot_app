part of '../view/splash_screen_view.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key, this.onStart});

  final void Function(VoidCallback start)? onStart;

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
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
    return GestureDetector(
      onTap: () {
        context.go('/login');
      },
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 2),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black45,
                  ],
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Continue to the app ...',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
