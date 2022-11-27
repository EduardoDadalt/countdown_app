import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/infra/datasource/i_countdown_datasource.dart';

class LocalCountdownDatasource implements CountdownDataSource {
  @override
  Future<List<Countdown>> getCountdowns() async {
    return [];
  }
}
