
import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SizedBox(
        child: CircularProgressIndicator(

          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),

        ),
      ),
    );
  }
}
