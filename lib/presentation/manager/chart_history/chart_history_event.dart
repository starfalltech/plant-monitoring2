part of 'chart_history_bloc.dart';

sealed class ChartHistoryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTempHistoryChart extends ChartHistoryEvent {}

class GetWaterHistoryChart extends ChartHistoryEvent {}
