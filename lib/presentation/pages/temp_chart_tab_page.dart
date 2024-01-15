import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/helpers/constant_values.dart';

class TempChartTabPage extends StatefulWidget {
  const TempChartTabPage({
    super.key,
  });

  @override
  State<TempChartTabPage> createState() => _TempChartTabPageState();
}

class _TempChartTabPageState extends State<TempChartTabPage> {
  final List<ChartData1> chartData = [
    ChartData1(2010, 35),
    ChartData1(2011, 13),
    ChartData1(2012, 34),
    ChartData1(2013, 27),
    ChartData1(2014, 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Temperature Realtime",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        SfCartesianChart(
          primaryXAxis: NumericAxis(),
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
            labelStyle:
                GoogleFonts.inter(fontSize: 12, color: const Color(0xffA3A3A3)),
          ),
          series: List<CartesianSeries>.generate(chartData.length, (index) {
            return SplineSeries<ChartData1, int>(
              xAxisName: "Date",
              yAxisName: "temp",
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData1 data, _) => data.x,
              yValueMapper: (ChartData1 data, _) => data.y,
            );
          }),
          // Initialize line series
        ),
      ],
    );
  }
}

class ChartData1 {
  ChartData1(this.x, this.y);

  final int x;
  final double? y;
}
