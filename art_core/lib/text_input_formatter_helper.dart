import 'package:flutter/services.dart';

class TextInputFormatterHelper extends TextInputFormatter {
  final RegExp _regExp;

  TextInputFormatterHelper(this._regExp);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (_regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    if (newValue.text == '') {
      return const TextEditingValue(text: '');
    }
    return oldValue;
  }
}
