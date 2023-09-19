import 'package:countdown_app/homepage/domain/entity/countdown.dart';

abstract class CountdownDataSource {
  Future<List<Countdown>> getCountdowns();
  Future<void> saveCountdowns(List<Countdown> countdowns);
}
