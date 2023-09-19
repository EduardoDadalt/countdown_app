import 'dart:convert';

import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/infra/datasource/i_countdown_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCountdownDatasource implements CountdownDataSource {
  static const String _countdownsKey = 'countdowns';
  @override
  Future<List<Countdown>> getCountdowns() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final List<String>? countdowns =
        sharedPreferences.getStringList(_countdownsKey);

    return countdowns?.map((countdown) {
          final json = jsonDecode(countdown);
          return Countdown.fromJson(json);
        }).toList() ??
        [];
  }

  @override
  Future<void> saveCountdowns(List<Countdown> countdowns) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final List<String> countdownsJson = countdowns.map((countdown) {
      final json = jsonEncode(countdown.toJson());
      return json;
    }).toList();

    await sharedPreferences.setStringList(_countdownsKey, countdownsJson);
  }
}
