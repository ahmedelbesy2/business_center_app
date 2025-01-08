import 'package:flutter/material.dart';

class CustomFormField<T> extends FormField<T> {
  const CustomFormField({
    super.key,
    required FormFieldSetter<T> onSaved,
    required FormFieldValidator<T> validator,
    required T initialValue,
    bool autoValidate = false,
    required Widget Function(FormFieldState<T>) builder,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: builder,
        );
}
