class Countdown {
  Countdown({
    required this.title,
    required this.date,
  });
  String title;
  DateTime date;

  Duration get duration => date.difference(DateTime.now());

  String toFormattedDuration() {
    final days = duration.inDays.toString().padLeft(2, "0");
    final hours = (duration.inHours % 24).toString().padLeft(2, "0");
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, "0");
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, "0");

    return '$days:$hours:$minutes:$seconds';
  }
}
