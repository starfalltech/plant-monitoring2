import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';
import 'package:plant_client/presentation/manager/home/home_bloc.dart';
import 'package:plant_client/presentation/pages/pages.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/helpers/constant_values.dart';

class WaterChartTabPage extends StatefulWidget {
  const WaterChartTabPage({
    super.key,
  });

  @override
  State<WaterChartTabPage> createState() => _WaterChartTabPageState();
}

class _WaterChartTabPageState extends State<WaterChartTabPage> {
  late ChartSeriesController _chartSeriesController;
  ValueNotifier<List<ChartDataEntity>> dataSource = ValueNotifier([]);

  void updatemethod(ChartDataEntity data, int length) {
    dataSource.value.add(data);
    dataSource.value.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        repository: RepositoryProvider.of<HomeRepository>(context),
      )..add(GetWaterRealTimeChartData()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ConstantValues.home_padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Water Realtime Chart",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const WaterChartHistoryPage()));
                  },
                  child: Text(
                    "View All >",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.status == HomeStatus.waterSuccess) {
                if (dataSource.value.isEmpty) {
                  dataSource.value = state.data;
                } else {
                  updatemethod(state.data.last, state.data.length);
                }
              }
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          ValueListenableBuilder(
              valueListenable: dataSource,
              builder: (context, value, _) {
                return SfCartesianChart(
                  primaryXAxis:
                      DateTimeAxis(intervalType: DateTimeIntervalType.seconds),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  plotAreaBorderWidth: 0,
                  backgroundColor: Colors.transparent,
                  margin: const EdgeInsets.only(right: 21, left: 16),
                  primaryYAxis: NumericAxis(
                    interactiveTooltip: const InteractiveTooltip(
                      enable: true,
                    ),
                    maximum: 7,
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
                      onRendererCreated: (controller) {
                        _chartSeriesController = controller;
                      },
                      enableTooltip: true,
                      dataSource: value,
                      xValueMapper: (ChartDataEntity data, _) => data.date,
                      yValueMapper: (ChartDataEntity data, _) => data.value,
                    ),
                  ],
                  // Initialize line series
                );
              }),
        ],
      ),
    );
  }
}
