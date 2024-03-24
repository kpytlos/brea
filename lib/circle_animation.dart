import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  final int breatheInDuration;
  final int breatheOutDuration;
  final int pauseInDuration;
  final int pauseOutDuration;

  const CircleAnimation({
    super.key,
    required this.breatheInDuration,
    required this.breatheOutDuration,
    required this.pauseInDuration,
    required this.pauseOutDuration,
  });

  @override
  CircleAnimationState createState() => CircleAnimationState();
}

class CircleAnimationState extends State<CircleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: widget
              .breatheInDuration), // Changed duration to breatheInDuration
      value: 0.0, // Start from 0.0
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: widget.pauseInDuration), () {
          _controller.duration = Duration(seconds: widget.breatheOutDuration);
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(seconds: widget.pauseOutDuration), () {
          _controller.duration = Duration(seconds: widget.breatheInDuration);
          _controller.forward();
        });
      }
    });
    _controller.forward();

    // Immediately reverse the animation to start from smallest circle
    _controller.reverse();
  }

  @override
  void didUpdateWidget(covariant CircleAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    restartAnimation(); // Restart animation when widget properties change
  }

  void restartAnimation() {
    _controller.reset(); // Reset the animation
    _controller.forward(); // Start the animation from the beginning
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // double maxMultiplier = 1.0; // Adjust for desired maximum size
        double multiplier = _controller.value; // Use controller value directly
        double minCircleSize = 100.0; // Minimum size for the circle

        return Container(
          width: minCircleSize + (multiplier * minCircleSize),
          height: minCircleSize + (multiplier * minCircleSize),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
