import 'package:recibo/src/model/payment_type.dart';

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
