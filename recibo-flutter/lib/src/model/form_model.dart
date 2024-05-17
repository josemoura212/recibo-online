class FormModel {
  int value;
  int month;
  int yaer;
  int monthsRecurrence;
  String tenant;
  String? documentTenant;
  String locator;
  String? documentlocatort;
  String street;
  String? complement;
  int number;
  String neighborhood;
  String propertyType;
  String city;
  String state;
  int zipCode;
  String? observation;
  String date;
  bool twoWay;
  Payment? payment;
  FormModel({
    required this.value,
    required this.month,
    required this.yaer,
    required this.monthsRecurrence,
    required this.tenant,
    this.documentTenant,
    required this.locator,
    this.documentlocatort,
    required this.street,
    this.complement,
    required this.number,
    required this.neighborhood,
    required this.propertyType,
    required this.city,
    required this.state,
    required this.zipCode,
    this.observation,
    required this.date,
    required this.twoWay,
    required this.payment,
  });
}

abstract class Payment {}

class Pix implements Payment {
  String key;
  String received;
  String bank;
  Pix({
    required this.key,
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

enum State {
  acre,
  alagoas,
  amapa,
  amazonas,
  bahia,
  ceara,
  distritoFederal,
  espiritoSanto,
  goias,
  maranhao,

  matoGrosso,
  matoGrossoDoSul,
  minasGerais,
  para,
  paraiba,
  parana,
  pernambuco,
  piaui,
  rioDeJaneiro,
  rioGrandeDoNorte,
  riograndeDoSul,
  rondonia,
  roraima,
  santaCatarina,
  saoPaulo,
  sergipe,
  tocantins,
}
