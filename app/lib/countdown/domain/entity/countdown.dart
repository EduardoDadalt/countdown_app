import 'package:freezed_annotation/freezed_annotation.dart';

part 'countdown.freezed.dart';
part 'countdown.g.dart';

@freezed
class Countdown with _$Countdown {
  const Countdown._();
  const factory Countdown({
    String? id,
    required String title,
    required DateTime date,
  }) = _Countdown;

  Duration get diffDuration {
    final now = DateTime.now();
    if (now.isAfter(date)) return Duration.zero;
    return date.difference(now);
  }

  String toFormattedDuration() {
    final duration = diffDuration;
    final days = duration.inDays.toString().padLeft(2, "0");
    final hours = (duration.inHours % 24).toString().padLeft(2, "0");
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, "0");
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, "0");

    return '$days:$hours:$minutes:$seconds';
  }

  factory Countdown.fromJson(Map<String, dynamic> json) =>
      _$CountdownFromJson(json);
}
