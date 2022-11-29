import 'package:countdown_app/countdown/controller/countdown_controller.dart';
import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/countdown/view/countdown_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CountdownList extends StatelessWidget {
  const CountdownList({super.key});

  @override
  Widget build(BuildContext context) {
    final countdowns = Provider.of<CountdownController>(context).countdowns;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: countdowns.length,
      itemBuilder: (context, index) {
        final Countdown countdown = countdowns[index];
        return CountdownCard(countdown: countdown);
      },
    );
  }
}
