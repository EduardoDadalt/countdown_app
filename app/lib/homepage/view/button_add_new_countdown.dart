import 'package:countdown_app/homepage/view/form_to_create_countdown.dart';
import 'package:flutter/material.dart';

class ButtonAddNewCountdown extends StatelessWidget {
  const ButtonAddNewCountdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const FormToCreateCountdown(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
