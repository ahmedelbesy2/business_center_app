import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreOverviewItem extends StatelessWidget {
  StoreOverviewItem({super.key, this.change, this.icon, this.iconColor, this.title, this.value});
  String? title;
  String? value;
  String? icon;
  Color? iconColor;
  String? change;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon ?? "",height: 40,width: 40,),
            const SizedBox(height: 16.0),
            Text(
              value ?? "",
              style: AppTextStyle.of(context).blackBold16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? "",
                  style: AppTextStyle.of(context).blackRegular16.copyWith(color: colorDarkGrey),
                ),
                Row(
                  children: [
                    if (change!.isNotEmpty)
                      Icon(
                        change!.startsWith('-') ? Icons.arrow_downward_outlined : Icons.arrow_upward,
                        size: 16,
                        color: change!.startsWith('-') ? Colors.red : Colors.green,
                      ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      change ?? "",
                      style: TextStyle(
                        color: change!.startsWith('-') ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
