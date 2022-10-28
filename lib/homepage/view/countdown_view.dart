import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({
    super.key,
    required this.countdown,
  });

  final Countdown countdown;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
