import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyReportsPage extends StatefulWidget {
  @override
  _MyReportsPageState createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> {
  final List<Map<String, String>> tableData = [
    {"name": "Devon Lane", "assigned": "80", "completed": "34  42%"},
    {"name": "Darrell Steward", "assigned": "60", "completed": "58  88%"},
    {"name": "Darlene Robertson", "assigned": "200", "completed": "87  59%"},
    {"name": "Kathryn Murphy", "assigned": "150", "completed": "84  82%"},
    {"name": "Marvin McKinney", "assigned": "300", "completed": "124  23%"},
  ];

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('USA', 7, '40%', Color(0xFFFFCB05)),
      ChartData('China', 27, '65%', Color(0xFF9597E9)),
      ChartData('Russia', 25, '60%', Color(0xFFC020C6)),
      ChartData('Germany', 11, '50%', Color(0xFF48BCF1)),
      ChartData('France', 8, '45%', Color(0xFF55D24F)),
    ];

    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Employee Performance",
                style: AppTextStyle.of(context).blackBold16.copyWith(color: const Color(0xFF4B5565)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        'Monthly',
                        style: AppTextStyle.of(context).blackBold16.copyWith(
                            color: const Color(0xFF4B5565), fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xFF4B5565)),
                  ],
                ),
              ),
            ],
          ),
        ),

        SfCircularChart(
          margin: EdgeInsets.zero,
          series: <CircularSeries>[
            PieSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointRadiusMapper: (ChartData data, _) => data.size,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                overflowMode: OverflowMode.shift,
                builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                  return Text(
                    data.x.toString(),
                    maxLines: 2,
                    style: AppTextStyle.of(context)
                        .blackRegular14
                        .copyWith(color: const Color(0xFF4B5565), fontSize: 12),
                  );
                },
                connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.line,
                  color: colorDarkGrey,
                  length: '25%',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size, this.color);
  final String x;
  final double y;
  final String size;
  final Color color;
}
