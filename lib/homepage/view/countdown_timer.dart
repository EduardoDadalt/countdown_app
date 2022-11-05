import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/view/animated_number.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    super.key,
    required this.countdown,
  });

  final Countdown countdown;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline3!,
      child: Row(
        children: countdown.toFormattedDuration().split("").map((letter) {
          if (letter.contains(RegExp(r'\d'))) {
            return AnimatedNumber(
              number: int.parse(letter),
            );
          }
          return Text(letter);
        }).toList(),
      ),
    );
  }
}
