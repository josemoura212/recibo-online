import 'package:flutter/services.dart';

class FormatterCpfOrCpnj extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String numericText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericText.length > 14) {
      numericText = numericText.substring(0, 14);
    }

    String formattedText;
    if (numericText.length <= 11) {
      formattedText = numericText.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d{3})(\d{1,2})'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}',
      );
    } else {
      formattedText = numericText.replaceAllMapped(
        RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{1,2})'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}',
      );
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
