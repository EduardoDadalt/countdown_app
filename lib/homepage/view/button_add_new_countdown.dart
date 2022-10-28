import 'package:countdown_app/constaints/containts.dart';
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

class FormToCreateCountdown extends StatefulWidget {
  const FormToCreateCountdown({
    Key? key,
  }) : super(key: key);

  @override
  State<FormToCreateCountdown> createState() => _FormToCreateCountdownState();
}

class _FormToCreateCountdownState extends State<FormToCreateCountdown> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new countdown',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: kLastDateDateTimePicker,
                      );
                      if (dateTime != null) {
                        setState(() {
                          this.dateTime = dateTime;
                        });
                      }
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                    },
                    child: const Icon(Icons.timelapse),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
