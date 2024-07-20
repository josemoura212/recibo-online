import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove tudo que não é número
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    // Garante que o texto tenha pelo menos 3 dígitos, preenchendo com zeros à esquerda se necessário
    if (newText.length <= 2) {
      newText = newText.padLeft(3, '0');
    }
    // Verifica se o valor excede o máximo permitido (999.999.999,99)
    if (BigInt.parse(newText) > BigInt.from(99999999999)) {
      // Se exceder, mantém o valor antigo
      newText = oldValue.text.replaceAll(RegExp(r'[^0-9]'), '');
      if (newText.length <= 2) {
        newText = newText.padLeft(3, '0');
      }
    }
    // Formata o texto como moeda
    String formattedText = _formatToCurrency(newText);
    // Atualiza o valor do campo com o texto formatado
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatToCurrency(String text) {
    // Converte a string para um valor inteiro
    int value = int.parse(text);
    // Converte o valor inteiro para um valor decimal, considerando os dois últimos dígitos como casas decimais
    double decimalValue = value / 100;
    // Formata o valor decimal como moeda, usando a biblioteca intl
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return currencyFormat.format(decimalValue);
  }
}
