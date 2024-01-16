import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';
import 'package:plant_client/presentation/manager/chart_history/chart_history_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TempChartHistoryPage extends StatefulWidget {
  const TempChartHistoryPage({super.key});

  @override
  State<TempChartHistoryPage> createState() => _TempChartHistoryPageState();
}

class _TempChartHistoryPageState extends State<TempChartHistoryPage> {
  final List<String> textList = [
    "1M",
    "5M",
    "20M",
    "30M",
    "1H",
    "2H",
  ];
  ValueNotifier<int> indexSelected = ValueNotifier(0);
  List<ChartDataEntity> datasource = [];
  ValueNotifier<List<ChartDataEntity>> datasourceCopy = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Temperature History",
          style: GoogleFonts.montserrat(fontSize: 16),
        ),
      ),
      body: BlocProvider<ChartHistoryBloc>(
        create: (context) =>
            ChartHistoryBloc(RepositoryProvider.of<HomeRepository>(context))
              ..add(GetTempHistoryChart()),
        child: BlocListener<ChartHistoryBloc, ChartHistoryState>(
          listener: (context, state) {
            if (state.status == ChartHistoryStatus.tempSuccess) {
              datasourceCopy.value = state.data;
              datasource = state.data;
            }
          },
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: datasourceCopy,
                  builder: (context, value, _) {
                    return SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                          intervalType: DateTimeIntervalType.seconds),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      plotAreaBorderWidth: 0,
                      backgroundColor: Colors.transparent,
                      margin: const EdgeInsets.only(right: 21, left: 16),
                      primaryYAxis: NumericAxis(
                        interactiveTooltip: const InteractiveTooltip(
                          enable: true,
                        ),
                        maximum: 75,
                        minimum: 0,
                        edgeLabelPlacement: EdgeLabelPlacement.hide,
                        majorGridLines: const MajorGridLines(width: 0),
                        majorTickLines: const MajorTickLines(
                          width: 0,
                        ),
                        axisLine: const AxisLine(width: 0),
                        labelStyle: GoogleFonts.inter(
                            fontSize: 12, color: const Color(0xffA3A3A3)),
                      ),
                      series: <SplineSeries<ChartDataEntity, DateTime>>[
                        SplineSeries<ChartDataEntity, DateTime>(
                          xAxisName: "Date",
                          yAxisName: "temp",
                          enableTooltip: true,
                          dataSource: value,
                          xValueMapper: (ChartDataEntity data, _) => data.date,
                          yValueMapper: (ChartDataEntity data, _) => data.value,
                        ),
                      ],
                      // Initialize line series
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                  valueListenable: indexSelected,
                  builder: (context, value, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        textList.length,
                        (index) => InkWell(
                          onTap: () {
                            indexSelected.value = index;

                            datasourceCopy.value = datasource
                                .where((element) => element.date.isAfter(
                                    DateTime.now().subtract(
                                        const Duration(minutes: 240))))
                                .toList();
                            print(datasource
                                .where((element) => element.date.isAfter(
                                    DateTime.now().subtract(
                                        const Duration(minutes: 240))))
                                .toList());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: value == index
                                  ? Colors.grey.shade300
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              textList[index],
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
