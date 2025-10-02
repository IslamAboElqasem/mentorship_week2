import 'package:flutter/material.dart';

class AnimatedLoadingDots extends StatefulWidget {
  final double dotSize;
  final Color dotColor;
  final Duration animationDuration;
  final double spacing;

  const AnimatedLoadingDots({
    super.key,
    this.dotSize = 12.0,
    this.dotColor = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.spacing = 8.0,
  });

  @override
  State<AnimatedLoadingDots> createState() => _AnimatedLoadingDotsState();
}

class _AnimatedLoadingDotsState extends State<AnimatedLoadingDots>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // Create animations for each dot
    _scaleAnimations = List.generate(3, (index) {
      // Each dot starts animating at different times
      final startDelay =
          (index * 0.2) * widget.animationDuration.inMilliseconds;
      final endDelay =
          ((index + 1) * 0.2 + 0.4) * widget.animationDuration.inMilliseconds;

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 40,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 60,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            startDelay / widget.animationDuration.inMilliseconds,
            endDelay / widget.animationDuration.inMilliseconds,
            curve: Curves.linear,
          ),
        ),
      );
    });

    _opacityAnimations = List.generate(3, (index) {
      // Each dot starts animating at different times
      final startDelay =
          (index * 0.2) * widget.animationDuration.inMilliseconds;
      final endDelay =
          ((index + 1) * 0.2 + 0.4) * widget.animationDuration.inMilliseconds;

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.3,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 40,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.3,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 60,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            startDelay / widget.animationDuration.inMilliseconds,
            endDelay / widget.animationDuration.inMilliseconds,
            curve: Curves.linear,
          ),
        ),
      );
    });

    // Start the animation and make it repeat
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: Transform.scale(
                scale: _scaleAnimations[index].value,
                child: Opacity(
                  opacity: _opacityAnimations[index].value,
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      color: widget.dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
