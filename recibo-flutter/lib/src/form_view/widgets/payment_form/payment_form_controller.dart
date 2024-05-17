import 'package:recibo/src/model/payment_type.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PaymentFormController {
  final _dinheiro = signal<bool>(true);
  final _pix = signal<bool>(false);
  final _cheque = signal<bool>(false);
  final _deposito = signal<bool>(false);
  final _cartao = signal<bool>(false);
  final _paymentType = signal<PaymentType>(PaymentType.dinheiro);

  bool get dinheiro => _dinheiro.value;
  bool get pix => _pix.value;
  bool get cheque => _cheque.value;
  bool get deposito => _deposito.value;
  bool get cartao => _cartao.value;
  PaymentType get paymentType => _paymentType.value;

  void dinheiroChanged(bool value) {
    _dinheiro.value = value;
    _pix.value = false;
    _cheque.value = false;
    _deposito.value = false;
    _cartao.value = false;
    _paymentType.value = PaymentType.dinheiro;
  }

  void pixChanged(bool value) {
    _pix.value = value;
    _dinheiro.value = false;
    _cheque.value = false;
    _deposito.value = false;
    _cartao.value = false;
    _paymentType.value = PaymentType.pix;
  }

  void chequeChanged(bool value) {
    _cheque.value = value;
    _pix.value = false;
    _dinheiro.value = false;
    _deposito.value = false;
    _cartao.value = false;
    _paymentType.value = PaymentType.cheque;
  }

  void depositoChanged(bool value) {
    _deposito.value = value;
    _pix.value = false;
    _cheque.value = false;
    _dinheiro.value = false;
    _cartao.value = false;
    _paymentType.value = PaymentType.deposito;
  }

  void cartaoChanged(bool value) {
    _cartao.value = value;
    _pix.value = false;
    _cheque.value = false;
    _dinheiro.value = false;
    _deposito.value = false;
    _paymentType.value = PaymentType.cartao;
  }
}
