import 'package:countdown_app/countdown/domain/entity/countdown.dart';

abstract class CountdownDataSource {
  Future<List<Countdown>> getCountdowns();
}
