import 'dart:async';

import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({
    super.key,
    required this.countdown,
  });

  final Countdown countdown;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(countdown.title,
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                  onPressed: () => {
                    Provider.of<CountdownController>(context, listen: false)
                        .removeCountdown(countdown)
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 20,
                )
              ],
            ),
            Text(
              countdown.toformatedDuration(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
