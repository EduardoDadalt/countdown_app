import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/view/countdown_view.dart';
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
        return CountdownView(countdown: countdown);
      },
    );
  }
}
