import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/countdown/infra/datasource/i_countdown_datasource.dart';

class LocalCountdownDatasource implements CountdownDataSource {
  @override
  Future<List<Countdown>> getCountdowns() async {
    return [];
  }
}
