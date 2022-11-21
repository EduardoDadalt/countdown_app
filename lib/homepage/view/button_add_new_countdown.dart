import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _titleController =
      TextEditingController(text: "");
  final DateTime now = DateTime.now();
  late DateTime _dateTime = DateTime(now.year, now.month, now.day + 1, 0, 0);
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 0);

  void setDateTime({DateTime? date, TimeOfDay? time}) {
    final DateTime dateTime = date ?? _dateTime;
    final TimeOfDay timeOfDay = time ?? _timeOfDay;
    _timeOfDay = timeOfDay;
    setState(() {
      _dateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new countdown',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              DateFormat("dd/M/yyyy HH:mm").format(_dateTime),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: kLastDateDateTimePicker,
                      );
                      if (dateTime != null) {
                        setDateTime(date: dateTime);
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                    label: const Text("Date"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if (timeOfDay != null) {
                        setDateTime(time: timeOfDay);
                      }
                    },
                    icon: const Icon(Icons.access_time),
                    label: const Text("Time"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Provider.of<CountdownController>(context, listen: false)
                    .addCountdown(
                  Countdown(
                    title: _titleController.text,
                    date: _dateTime,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
