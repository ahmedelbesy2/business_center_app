import 'package:art_core/extensions/widgets_extensions.dart';

import '../art_core.dart';
import '../theme/app_text_style.dart';

class CheckBoxWithText extends StatefulWidget {
  const CheckBoxWithText({
    super.key,
    this.text,
    this.value,
    this.onChanged,
  });
  final String? text;
  final bool? value;
  final Function(bool?)? onChanged;

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  // bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(

            value: widget.value,

            onChanged: widget.onChanged,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            checkColor: colorGreen,
            activeColor: Colors.white,
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(
                width: 1.5,
                strokeAlign: 3,
                color: colorPrimary,
              ),
            )),
        Text(
          widget.text ?? "",
          style: AppTextStyle.of(context).blackRegular16,
        )
      ],
    );
  }
}
