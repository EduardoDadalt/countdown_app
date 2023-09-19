import 'package:countdown_app/homepage/domain/entity/countdown.dart';
import 'package:countdown_app/homepage/infra/datasource/i_countdown_datasource.dart';

class CountdownRepository {
  final CountdownDataSource _localDatasource;

  CountdownRepository({
    required CountdownDataSource localDatasource,
  }) : _localDatasource = localDatasource;

  Future<List<Countdown>> getCountdowns() {
    return _localDatasource.getCountdowns();
  }

  Future<void> saveCountdowns(List<Countdown> countdowns) =>
      _localDatasource.saveCountdowns(countdowns);
}
