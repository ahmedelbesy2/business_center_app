import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class ErrorView extends StatelessWidget {
  final Function onRetryClick;
  final String? errorMessage;

  const ErrorView({Key? key, required this.onRetryClick, this.errorMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage ?? "something_went_wrong".tr(),
              style: AppTextStyle.of(context).blackRegular16),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                onRetryClick();
              },
              child: Icon(
                Icons.refresh,
                color: colorPrimary,
                size: 40,
              )),
        ],
      ),
    );
  }
}
