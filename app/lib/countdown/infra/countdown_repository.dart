import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/countdown/infra/datasource/i_countdown_datasource.dart';

class CountdownRepository {
  final CountdownDataSource _localDatasource;

  CountdownRepository({
    required CountdownDataSource localDatasource,
  }) : _localDatasource = localDatasource;

  Future<List<Countdown>> getCountdowns() {
    return _localDatasource.getCountdowns();
  }
}
