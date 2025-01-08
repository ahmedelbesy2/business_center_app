import 'package:art_core/theme/app_text_style.dart';
import 'package:art_core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/widget/shipment_over_time_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home/presentation/widget/shipment_financials_view.dart';

import 'employee_performance_view.dart';
class TabBarViewItems extends StatefulWidget {
  const TabBarViewItems({
    super.key,
  });

  @override
  State<TabBarViewItems> createState() => _TabBarViewItemsState();
}

class _TabBarViewItemsState extends State<TabBarViewItems> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Create a TabController

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          child: Container(
            height: 38.h,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(9),
            ),
            child: TabBar(
              controller: _tabController,
              splashBorderRadius: BorderRadius.circular(0),
              splashFactory: NoSplash.splashFactory,

              onTap: (v) {
                setState(() {});
              },
              labelStyle: AppTextStyle.of(context).primaryBold14,
              unselectedLabelStyle: AppTextStyle.of(context).blackRegular16.copyWith(color: const Color(0xFF697586)),

              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,

              indicator: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(7),
                // Rounded corners
              ),
              // Rem
              tabs: const [
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "Financial",
                ),
                Tab(
                  text: "Performance",
                ),
              ],
            ),
          ),
        ),
        //  const SizedBox(height: 10),
        Expanded(
          child: TabBarView(physics:  NeverScrollableScrollPhysics(), controller: _tabController, children: [
             const ShipmentOverTimeView(),
             ShipmentFinancialsView(),
            MyReportsPage(),
          ]),
        ),
      ],
    );
  }
}
