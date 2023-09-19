import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/view/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownCard extends StatelessWidget {
  const CountdownCard({
    super.key,
    required this.countdown,
  });

  final Countdown countdown;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(countdown),
      onDismissed: (_) {
        Provider.of<CountdownController>(context, listen: false)
            .removeCountdown(countdown);
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      child: Card(
        child: ExpansionTile(
          title: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(countdown.title,
                    style: Theme.of(context).textTheme.titleLarge),
                CountdownTimer(countdown: countdown),
              ],
            ),
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Delete"),
              onTap: () {
                Provider.of<CountdownController>(context, listen: false)
                    .removeCountdown(countdown);
              },
            )
          ],
        ),
      ),
    );
  }
}
