import 'package:art_core/widgets/app_text.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../art_core.dart';

class ChangeLangButton extends StatelessWidget {
  const ChangeLangButton({super.key, this.callBack});

  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (context.locale.languageCode == "ar") {
            context.setLocale(const Locale("en"));
          } else {
            context.setLocale(const Locale("ar"));
          }
          PreferenceManager().saveLanguage(context.locale.languageCode);
        (context as Element).visitChildren(rebuild);
          callBack?.call();
        },
        child: AppText(
          text: 'ar'.tr(),
        ));
  }
}

void rebuild(Element e) {
  e.markNeedsBuild();
  e.visitChildren(rebuild);
}
