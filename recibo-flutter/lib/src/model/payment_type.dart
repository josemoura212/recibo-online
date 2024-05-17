enum PaymentType {
  dinheiro,
  pix,
  cheque,
  deposito,
  cartao,
}

abstract class Payment {}

class Pix implements Payment {
  String pixKey;
  String received;
  String bank;
  Pix({
    required this.pixKey,
    required this.received,
    required this.bank,
  });
}

class Cheque implements Payment {
  String numeroDoCheque;
  String banco;
  String agencia;
  String? bomPara;
  Cheque({
    required this.numeroDoCheque,
    required this.banco,
    required this.agencia,
    this.bomPara,
  });
}

class Deposito implements Payment {
  String conta;
  String agencia;
  String data;
  String banco;
  String favorecido;
  String? numeroDoDocumento;
  Deposito({
    required this.conta,
    required this.agencia,
    required this.data,
    required this.banco,
    required this.favorecido,
    this.numeroDoDocumento,
  });
}

class Dinheiro implements Payment {}

class Cartao implements Payment {}
