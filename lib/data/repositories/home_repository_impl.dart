import 'package:plant_client/data/data_sources/home_remote_datasources.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSources _remoteDataSources;

  HomeRepositoryImpl(this._remoteDataSources);

  @override
  Stream<List<ChartDataEntity>> getTempChartData() {
    return _remoteDataSources.getTempChartData();
  }

  @override
  Stream<List<ChartDataEntity>> getWaterChartData() {
    return _remoteDataSources.getWaterChartData();
  }

  @override
  Future<List<ChartDataEntity>> getTempChartHistory() {
    return _remoteDataSources.getTempChartHistory();
  }

  @override
  Future<List<ChartDataEntity>> getWaterChartHistory() {
    return _remoteDataSources.getWaterChartHistory();
  }
}
