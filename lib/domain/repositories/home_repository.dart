import 'package:plant_client/domain/entities/chart_data_entity.dart';

abstract class HomeRepository {
  Stream<List<ChartDataEntity>> getTempChartData();

  Stream<List<ChartDataEntity>> getWaterChartData();

  Future<List<ChartDataEntity>> getTempChartHistory();

  Future<List<ChartDataEntity>> getWaterChartHistory();
}
