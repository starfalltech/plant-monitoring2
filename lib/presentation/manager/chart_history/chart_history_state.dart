part of 'chart_history_bloc.dart';

enum ChartHistoryStatus { initial, tempSuccess, waterSuccess, failure, loading }

final class ChartHistoryState extends Equatable {
  final List<ChartDataEntity> data;
  final ChartHistoryStatus status;

  const ChartHistoryState({
    this.data = const <ChartDataEntity>[],
    this.status = ChartHistoryStatus.initial,
  });

  ChartHistoryState copyWith({
    List<ChartDataEntity>? data,
    ChartHistoryStatus? status,
  }) =>
      ChartHistoryState(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data, status];
}
