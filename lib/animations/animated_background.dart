import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class BackgroudAnimation extends StatefulWidget {
  final Widget child;
  BackgroudAnimation(this.child);
  @override
  _BackgroudAnimationState createState() => _BackgroudAnimationState();
}

class _BackgroudAnimationState extends State<BackgroudAnimation>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      vsync: this,
      behaviour: BubblesBehaviour(),
      child: widget.child,
    );
  }
}
