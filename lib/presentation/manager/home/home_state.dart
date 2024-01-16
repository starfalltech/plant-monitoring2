part of 'home_bloc.dart';

enum HomeStatus { initial, tempSuccess, waterSuccess, failure, loading }

final class HomeState extends Equatable {
  final List<ChartDataEntity> data;
  final HomeStatus status;

  const HomeState({
    this.data = const <ChartDataEntity>[],
    this.status = HomeStatus.initial,
  });

  HomeState copyWith({
    List<ChartDataEntity>? data,
    HomeStatus? status,
  }) =>
      HomeState(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data, status];
}
