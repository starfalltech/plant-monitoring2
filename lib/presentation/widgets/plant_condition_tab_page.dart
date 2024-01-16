import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/core/helpers/constant_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlantConditionTabPage extends StatelessWidget {
  const PlantConditionTabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: ConstantValues.home_padding,
            bottom: MediaQuery.of(context).size.height * 0.04,
          ),
          child: Text(
            "Plant Condition",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SfCircularChart(
          legend: const Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            // Overflowing legend content will be wraped
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: getChartData(),
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
              dataLabelMapper: (data, value) => "${data.y.toInt()}%",
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            )
          ],
        ),
      ],
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Water', 30),
      ChartData('Light', 40),
      ChartData('Temp', 20),
      ChartData('Humadity', 10),
    ];
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
