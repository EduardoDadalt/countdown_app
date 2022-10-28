import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/view/button_add_new_countdown.dart';
import 'package:countdown_app/homepage/view/countdown_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final countdowns = Provider.of<CountdownController>(context).countdowns;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countedown App'),
      ),
      body: Column(
        children: countdowns
            .map((countdown) => CountdownView(countdown: countdown))
            .toList(),
      ),
      floatingActionButton: const ButtonAddNewCountdown(),
    );
  }
}
