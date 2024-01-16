part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTempRealTimeChartData extends HomeEvent {}

class GetWaterRealTimeChartData extends HomeEvent {}
