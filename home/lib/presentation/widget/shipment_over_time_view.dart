import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ShipmentOverTimeView extends StatelessWidget {
  const ShipmentOverTimeView({super.key});
  List<ChartData> _getChartData() {
    return [
      ChartData('Created', 200, const Color(0xFFCDD5DF)),
      ChartData('Pick up', 150, const Color(0xFFCDD5DF)),
      ChartData('In transit', 113, const Color(0xFF52ACFF)), // Highlighted bar
      ChartData('Delivered', 300, const Color(0xFFCDD5DF)),
      ChartData('Returned', 50, const Color(0xFFCDD5DF)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipment over time",style: AppTextStyle.of(context).blackBold16,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      border: Border.all( color: Colors.grey.shade300,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weekly',
                          style: AppTextStyle.of(context).blackBold16.copyWith(color: const Color(0xFF4B5565),fontWeight: FontWeight.w500),
                        ),
                        const Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xFF4B5565)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      border: Border.all( color: Colors.grey.shade300,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/images/config_calendar.svg",height: 27,),
                  )
                ],
              )
            ],
          ),
        ),
        SfCartesianChart(
          backgroundColor: Colors.transparent,
          enableSideBySideSeriesPlacement: true,
          plotAreaBorderWidth: 0,
          primaryXAxis: const CategoryAxis(
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
            labelStyle: TextStyle(color: Color(0xFF697586)),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 500,
            interval: 100,
            axisLine: const AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0.01, color: Colors.grey.shade400),
          ),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              dataSource: _getChartData(),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Stages',
              width: 0.5,
              pointColorMapper: (ChartData data, _) => data.color,
            ),
          ],
          tooltipBehavior: TooltipBehavior(
            enable: true,
            builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
              return Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  '${data.y}',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}
