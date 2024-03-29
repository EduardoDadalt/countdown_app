import 'package:countdown_app/homepage/view/button_add_new_countdown.dart';
import 'package:countdown_app/homepage/view/list_countdowns.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown App'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: CountdownList(),
          ),
        ],
      ),
      floatingActionButton: const ButtonAddNewCountdown(),
    );
  }
}
