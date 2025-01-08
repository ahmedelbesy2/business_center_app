import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class ShipmentFinancialsView extends StatelessWidget {
  @override

  final String? title;
  ShipmentFinancialsView({super.key, this.title});

  final Map<String, double> dataMap = {
    "Total Delivered": 400,
    "Delivery Cost": 200,
    "Net Profit": 400,
  };

  final List<Color> colorList = [
    const Color(0xFF52ACFF),
    const Color(0xFFFFCC00),
    const Color(0xFF00C7BE),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title??   "Shipment Financials",
                style: AppTextStyle.of(context).blackBold16.copyWith(color: Color(0xFF4B5565)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        'Weekly',
                        style: AppTextStyle.of(context).blackBold16.copyWith(color: const Color(0xFF4B5565), fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xFF4B5565)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartType: ChartType.ring,
            chartRadius: MediaQuery.of(context).size.width / 2.7,
            colorList: colorList,
            ringStrokeWidth: 23,
            centerWidget: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: colorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$ ',
                          style: AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey.shade600),
                        ),
                        TextSpan(text: "987.00", style: AppTextStyle.of(context).blackRegular16.copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    style: AppTextStyle.of(context).blackRegular16,
                  ),
                  Text(
                    "Net Profit",
                    style: AppTextStyle.of(context).blackRegular14.copyWith(color: const Color(0xFF4B5565)),
                  ),
                ],
              ),
            ),
            legendOptions: const LegendOptions(
              showLegends: false,
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
            ),
          ),
          SizedBox(height: 40.h),
          Column(
            children: [
              Divider(
                height: .5,
                color: colorGrey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildFinancialRow(
                    dataMap.entries.elementAt(0).key, // "Total Delivered"
                    '${dataMap["Total Delivered"]!.toStringAsFixed(0)} units',
                    context,
                    colorList[0],
                  ),
                  Container(height: 60, width: 0.5, color: colorGrey),
                  buildFinancialRow(
                    dataMap.entries.elementAt(1).key, // "Delivery Cost"
                    dataMap["Delivery Cost"]!.toStringAsFixed(2),
                    context,
                    colorList[1],
                  ),
                  Container(height: 60, width: 0.5, color: colorGrey),
                  buildFinancialRow(
                    dataMap.entries.elementAt(2).key, // "Net Profit"
                    dataMap["Net Profit"]!.toStringAsFixed(2),
                    context,
                    colorList[2],
                  ),
                ],
              ),
              Divider(
                height: .5,
                color: colorGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFinancialRow(String title, String value, BuildContext context, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(title, style: AppTextStyle.of(context).blackRegular14.copyWith(color: const Color(0xFF697586), fontSize: 13)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\$ ',
                  style: AppTextStyle.of(context).blackBold16.copyWith(color: colorDarkGrey),
                ),
                TextSpan(text: value, style: AppTextStyle.of(context).blackBold16.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            style: AppTextStyle.of(context).blackRegular16,
          )
        ],
      ),
    );
  }
}
