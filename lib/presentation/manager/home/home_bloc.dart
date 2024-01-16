import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<GetTempRealTimeChartData>(
      (event, emit) async {
        await emit.onEach<List<ChartDataEntity>>(
          repository.getTempChartData(),
          onData: (data) {
            data.sort((a, b) => a.date.compareTo(b.date));
            emit(
              state.copyWith(
                status: HomeStatus.tempSuccess,
                data: data.sublist(data.length - 7),
              ),
            );
          },
          onError: (_, s) {
            print("thisss is error ${s}");
          },
        );
      },
      transformer: restartable(),
    );
    on<GetWaterRealTimeChartData>(
      (event, emit) async {
        await emit.onEach<List<ChartDataEntity>>(
          repository.getWaterChartData(),
          onData: (data) {
            data.sort((a, b) => a.date.compareTo(b.date));
            emit(
              state.copyWith(
                status: HomeStatus.waterSuccess,
                data: data.sublist(data.length - 7),
              ),
            );
          },
          onError: (_, s) {
            print("thisss is error ${s}");
          },
        );
      },
      transformer: restartable(),
    );
  }
}
