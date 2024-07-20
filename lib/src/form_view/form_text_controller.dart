import 'package:flutter/material.dart';
import '../model/form_model.dart';
import '../model/payment_type.dart';

mixin FormTextController {
  final formKey = GlobalKey<FormState>();
  String value = "";
  final monthEC = TextEditingController();
  String year = "";
  String monthsRecurrence = "";
  String tenant = "";
  String documentTenant = "";
  String locator = "";
  String documentLocator = "";
  String zipCode = "";
  String street = "";
  String complement = "";
  String number = "";
  String neighborhood = "";
  String propertyType = "";
  String city = "";

  final stateEC = TextEditingController();

  final observationEC = TextEditingController();
  final dateEC = TextEditingController();

  void formDispose() {
    monthEC.dispose();

    stateEC.dispose();

    observationEC.dispose();
    dateEC.dispose();
  }

  void formReset() {
    monthEC.clear();

    stateEC.clear();

    observationEC.clear();
    dateEC.clear();
  }

  FormModel save() {
    return FormModel(
      value: int.parse(value),
      month: int.parse(monthEC.text),
      yaer: int.parse(year),
      monthsRecurrence: int.parse(monthsRecurrence),
      tenant: tenant,
      documentTenant: documentTenant,
      locator: locator,
      documentlocatort: documentLocator,
      street: street,
      complement: complement,
      number: int.parse(number),
      neighborhood: neighborhood,
      propertyType: propertyType,
      city: city,
      state: stateEC.text,
      zipCode: int.parse(zipCode),
      observation: observationEC.text,
      date: dateEC.text,
      twoWay: false,
      payment: Dinheiro(),
    );
  }
}
