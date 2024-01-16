import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';

part 'chart_history_event.dart';
part 'chart_history_state.dart';

class ChartHistoryBloc extends Bloc<ChartHistoryEvent, ChartHistoryState> {
  final HomeRepository repository;
  ChartHistoryBloc(this.repository) : super(const ChartHistoryState()) {
    on<GetTempHistoryChart>((event, emit) async {
      emit(const ChartHistoryState(status: ChartHistoryStatus.loading));
      try {
        final data = await repository.getTempChartHistory();
        emit(ChartHistoryState(
            status: ChartHistoryStatus.tempSuccess, data: data));
      } catch (e, s) {
        print(s);
        emit(const ChartHistoryState(status: ChartHistoryStatus.failure));
      }
    });
  }
}
