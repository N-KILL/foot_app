part of '../view/splash_screen_view.dart';

class BallAnimation extends StatefulWidget {
  const BallAnimation({super.key});

  @override
  State<BallAnimation> createState() => _BallAnimationState();
}

class _BallAnimationState extends State<BallAnimation>
    with TickerProviderStateMixin {
  /// Manage the bounce animation of the ball
  late AnimationController _controller;

  /// Manage the movement of the ball to the middle of the screen
  late Animation<double> _horizontalAnimation;

  /// Manage the bounces of the ball
  late Animation<double> _verticalAnimation;

  /// Manages the animation of the ball when it is pressed
  late AnimationController _ballHitController;

  /// Manage the X position of the ball
  late Animation<double> _hitHorizontalAnimation;

  /// Manage the Y position of the ball
  late Animation<double> _hitVerticalAnimation;

  /// Manage the scale of the ball
  late Animation<double> _ballScaleAnimation;

  bool _ballPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Handle the movement of the ball to the middle of the screen
    _horizontalAnimation = Tween<double>(begin: 1.2, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );

    // Handle the bounce of the ball
    _verticalAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 0.3)
            .chain(CurveTween(curve: Curves.easeOutQuad)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.3, end: 1)
            .chain(CurveTween(curve: Curves.easeInOutQuad)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0.7)
            .chain(CurveTween(curve: Curves.easeOutQuad)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.7, end: 1)
            .chain(CurveTween(curve: Curves.easeInOutQuad)),
        weight: 10,
      ),
    ]).animate(_controller);

    // Handle the movement of the ball to the corner of the screen
    _ballHitController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _controller.forward();
  }

  /// Handle the tap on the ball
  /// Once the ball is pressed, it will start moving
  Future<void> _onBallTap() async {
    if (_ballPressed) return;
    setState(() {
      _ballPressed = true;
    });
    // Starts the logo animation if the callback exists
    _logoAnimationStart?.call();
    _textAnimationStart?.call();
    await _ballHitController.forward();
  }

  // Callback to start the logo animation
  VoidCallback? _logoAnimationStart;

  // Callback to start the text animation
  VoidCallback? _textAnimationStart;

  @override
  void dispose() {
    _controller.dispose();
    _ballHitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final baseBallSize = size.height * 0.25;

    // Final position of the ball before the hit animation
    final endLeft = size.width * 0.5 - baseBallSize / 2;
    final endTop = size.height - baseBallSize;

    _hitHorizontalAnimation = Tween<double>(
      // Animation starts where the ball is located X value
      begin: endLeft,

      // Animation ends at this value
      end: 325,
    ).animate(
      CurvedAnimation(
        parent: _ballHitController,
        curve: Curves.easeInOutCubic,
      ),
    );

    _hitVerticalAnimation = Tween<double>(
      // Animation starts where the ball is located Y value
      begin: endTop,

      // Animation ends at this value
      end: 260,
    ).animate(
      CurvedAnimation(
        parent: _ballHitController,
        curve: Curves.easeInOutCubic,
      ),
    );

    // Animation of the ball scale when pressed
    // The ball will scale down to 0.3 of its size
    _ballScaleAnimation = Tween<double>(
      begin: 1,
      end: 0.22,
    ).animate(
      CurvedAnimation(
        parent: _ballHitController,
        curve: Curves.easeInOutCubic,
      ),
    );

    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _ballHitController]),
      builder: (context, child) {
        // Values to position the ball
        double left;
        double top;
        double scale;

        if (!_ballPressed) {
          // Grabs the values to position the ball in the middle of the screen
          // during the bounce animation
          final ballSize = baseBallSize;
          left = size.width * _horizontalAnimation.value - ballSize / 2;
          final verticalValue = _verticalAnimation.value;
          top = (size.height - ballSize) * verticalValue;
          scale = 1.0;
        } else {
          // Once the ball is pressed, it will move to the indicated values by
          // the animation
          left = _hitHorizontalAnimation.value;
          top = _hitVerticalAnimation.value;
          scale = _ballScaleAnimation.value;
        }

        // Value that handles the size of the ball
        final ballSize = baseBallSize * scale;
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              top: size.height * 0.23,
              child: SizedBox(
                width: size.width,
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(
                    'assets/images/goal.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: left,
              top: top,
              child: GestureDetector(
                onTap: _onBallTap,
                child: SizedBox(
                  width: ballSize,
                  height: ballSize,
                  child: Image.asset(
                    'assets/images/ball.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: size.height * 0.05,
              child: SizedBox(
                width: size.width,
                height: 150,
                child: LogoAnimation(
                  onStart: (VoidCallback start) {
                    _logoAnimationStart = start;
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: size.height * 0.9,
              child: SizedBox(
                width: size.width,
                height: 50,
                child: TextAnimation(
                  onStart: (VoidCallback start) {
                    _textAnimationStart = start;
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
