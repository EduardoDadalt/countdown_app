import 'dart:async';

import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownView extends StatefulWidget {
  const CountdownView({
    super.key,
    required this.countdown,
  });

  final Countdown countdown;

  @override
  State<CountdownView> createState() => _CountdownViewState();
}

class _CountdownViewState extends State<CountdownView> {
  late Duration duration = calcDuration();

  Timer? timer;

  Duration calcDuration() => widget.countdown.date.difference(DateTime.now());

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        duration = calcDuration();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final days = duration.inDays.toString().padLeft(2, "0");
    final hours = (duration.inHours % 24).toString().padLeft(2, "0");
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, "0");
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, "0");

    return '$days:$hours:$minutes:$seconds';
  }

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
                Text(widget.countdown.title,
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                  onPressed: () => {
                    Provider.of<CountdownController>(context, listen: false)
                        .removeCountdown(widget.countdown)
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 20,
                )
              ],
            ),
            Text(
              formatDuration(duration),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
