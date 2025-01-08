import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField({
    super.key,
    this.prefixIcon,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.suffixIcon,
    this.onTap,
    this.decoration,
    this.hintText,
    this.validator,
    this.readOnly,
  });

  final Widget? prefixIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Decoration? decoration;
  final String? hintText;
  final bool? readOnly;
  final String? Function(String?)? validator;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  @override
  Widget build(BuildContext context) {
    debugPrint('dddddd ======= ${widget.readOnly.toString()}');
    return GestureDetector(
      child: Container(
        decoration: widget.decoration,
        child: TextFormField(
          readOnly: widget.readOnly ?? false,
          onTap: () {
            widget.onTap!();
            widget.controller.selection = TextSelection(baseOffset: 0, extentOffset: widget.controller.value.text.length);
          },
          focusNode: widget.focusNode,
          onChanged: (value) {
            setState(() {});
            widget.onChanged?.call(value);
          },
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
              hintStyle: AppTextStyle.of(context).greyRegular14.copyWith(fontSize: 16, color: const Color(0xFF98AEB9)),
              hintText: widget.hintText,
              suffixIcon: (widget.controller.text.isNotEmpty && (widget.focusNode != null ? widget.focusNode! : FocusNode()).hasFocus ?? false) ? widget.suffixIcon : null,
              prefixIcon: widget.prefixIcon,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorBorder,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8))),
        ),
      ),
    );
  }
}
