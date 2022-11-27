import 'package:countdown_app/homepage/domain/entity/countdown.dart';

abstract class CountdownDataSource {
  Future<List<Countdown>> getCountdowns();
}
