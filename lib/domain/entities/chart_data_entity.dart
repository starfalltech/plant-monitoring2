import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_data_entity.freezed.dart';
part 'chart_data_entity.g.dart';

@Freezed()
class ChartDataEntity with _$ChartDataEntity {
  const factory ChartDataEntity({
    required DateTime date,
    required int value,
  }) = _ChartDataEntity;

  factory ChartDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ChartDataEntityFromJson(json);
}
