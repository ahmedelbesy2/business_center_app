import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/app_bar_home_view.dart';
import '../widget/shipment_financials_view.dart';
import '../widget/store_overview_grid_view.dart';

import '../widget/tab_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray200,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95.h),
        child: const AppBarHomeView(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Store Overview",
                style: AppTextStyle.of(context).blackBold14.copyWith(color: colorDarkGrey, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8.h,
              ),
              const StoreOverviewGridView(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "My Report",
                style: AppTextStyle.of(context).blackBold14.copyWith(color: colorDarkGrey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                        child: TabBarViewItems(),
                      ),
                      Expanded(
                          child: ShipmentFinancialsView(
                        title: "Delivery by Province",
                      )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
