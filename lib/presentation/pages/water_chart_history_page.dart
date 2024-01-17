import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';
import 'package:plant_client/presentation/manager/chart_history/chart_history_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterChartHistoryPage extends StatefulWidget {
  const WaterChartHistoryPage({super.key});

  @override
  State<WaterChartHistoryPage> createState() => _WaterChartHistoryPageState();
}

class _WaterChartHistoryPageState extends State<WaterChartHistoryPage> {
  final List<String> textList = [
    "5M",
    "10M",
    "1H",
    "3H",
    "12H",
    "1D",
  ];
  ValueNotifier<int> indexSelected = ValueNotifier(3);
  List<ChartDataEntity> datasource = [];
  ValueNotifier<List<ChartDataEntity>> datasourceCopy = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Water(Ph) History",
          style: GoogleFonts.montserrat(fontSize: 16),
        ),
      ),
      body: BlocProvider<ChartHistoryBloc>(
        create: (context) =>
            ChartHistoryBloc(RepositoryProvider.of<HomeRepository>(context))
              ..add(GetWaterHistoryChart()),
        child: BlocListener<ChartHistoryBloc, ChartHistoryState>(
          listener: (context, state) {
            if (state.status == ChartHistoryStatus.waterSuccess) {
              datasourceCopy.value = state.data
                  .where((element) => element.date.isAfter(
                      DateTime.now().subtract(const Duration(hours: 3))))
                  .toList();
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
                        maximum: 8,
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
                          yAxisName: "water",
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

                            if (indexSelected.value == 0) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now().subtract(
                                          const Duration(minutes: 5))))
                                  .toList();
                            } else if (indexSelected.value == 1) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now().subtract(
                                          const Duration(minutes: 10))))
                                  .toList();
                            } else if (indexSelected.value == 2) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now()
                                          .subtract(const Duration(hours: 1))))
                                  .toList();
                            } else if (indexSelected.value == 3) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now()
                                          .subtract(const Duration(hours: 3))))
                                  .toList();
                            } else if (indexSelected.value == 4) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now()
                                          .subtract(const Duration(hours: 12))))
                                  .toList();
                            } else if (indexSelected.value == 5) {
                              datasourceCopy.value = datasource
                                  .where((element) => element.date.isAfter(
                                      DateTime.now()
                                          .subtract(const Duration(days: 1))))
                                  .toList();
                            }
                            int x = 0;
                            datasourceCopy.value.forEach((element) {
                              print("${element.toJson()} ${x++}");
                            });
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
