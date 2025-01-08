import 'package:art_core/art_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/app_text_style.dart';

class AppTextField extends StatefulWidget {
  final bool? readOnly;
  final bool? autofocus;
  final int? maxLines;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final bool isSelectable;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  final String? errorText;
  final Color? borderColor;
  final Color? labelColor;

  final bool isPassword;
  final bool? enabled;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  final int? maxLength;

  final Function()? onTap;

  final String? initialText;

  final EdgeInsets? contentPadding;

  final Color? fillColor;
  final bool? filled;
  final bool? enableBorder;
  final double horizontalPadding;

  const AppTextField(
      {Key? key,
      this.readOnly = false,
      this.maxLines = 1,
      this.onTap,
      this.autofillHints,
      this.focusNode,
      this.hint,
      this.label,
      this.autofocus,
      this.textInputType,
      this.suffixIcon,
      this.prefixIcon,
      this.isPassword = false,
      this.validator,
      this.onChanged,
      this.errorText,
      this.initialText,
      this.borderColor,
      this.hintStyle,
      this.isSelectable = false,
      this.controller,
      this.maxLength,
      this.contentPadding,
      this.fillColor,
      this.filled,
      this.labelColor,
      this.enableBorder = true,
      this.horizontalPadding = 24,
      this.inputFormatters,
      this.enabled})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      autofillHints: widget.autofillHints ?? [AutofillHints.username],
      onTap: widget.onTap ?? () {},
      initialValue: widget.initialText,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      validator: widget.validator,
      readOnly: widget.readOnly ?? false,
      maxLines: widget.maxLines,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword == true ? obscureText : false,
      maxLength: widget.maxLength,
      style: AppTextStyle.of(context).blackRegular16,


      decoration: InputDecoration(
          fillColor: widget.fillColor,


          filled: widget.filled,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 15.h,vertical: 15),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ?? TextStyle(color: widget.labelColor ?? iconColor, fontWeight: FontWeight.normal, fontSize: 14,),
          labelText: widget.label,

          alignLabelWithHint: true,
          labelStyle: TextStyle(color: widget.labelColor ?? Colors.black, fontWeight: FontWeight.w500),
          errorText: widget.errorText == null || widget.errorText!.isEmpty || widget.errorText == '' ? null : widget.errorText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? InkWell(
                      onTap: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      child:
                      !obscureText ?   Icon(Icons.remove_red_eye_outlined)
                      : Icon(Icons.remove_red_eye)


              )
                  : widget.isSelectable
                      ? SizedBox(
                          child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30.sp,
                          color: colorBorder,
                        ))
                      : null)),

      // textDirection: TextDirection.ltr,
      // cursorColor: AppColors.primaryColorLight,
    );
  }
}
