import 'package:flutter/material.dart';

class AnimatedNumber extends StatefulWidget {
  const AnimatedNumber({
    super.key,
    required this.number,
  });

  final int number;

  @override
  State<AnimatedNumber> createState() => _AnimatedNumberState();
}

class _AnimatedNumberState extends State<AnimatedNumber>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int oldNumber = widget.number;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedNumber oldWidget) {
    if (oldWidget.number != widget.number) {
      oldNumber = oldWidget.number;
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final double sizeOfFont =
        DefaultTextStyle.of(context).style.fontSize! * 1.5;
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Positioned(
            top: (_animation.value - 1) * sizeOfFont,
            child: Text(
              widget.number.toString(),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Positioned(
            top: _animation.value * sizeOfFont,
            child: Text(
              oldNumber.toString(),
            ),
          ),
        ),
        const Text(
          "0",
          style: TextStyle(color: Colors.transparent),
        ), // This is a trick to make stack with size of number,
      ],
    );
  }
}
