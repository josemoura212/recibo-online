import 'package:flutter/material.dart';
import '../model/form_model.dart';
import '../model/payment_type.dart';

mixin FormTextController {
  final formKey = GlobalKey<FormState>();
  final valueEC = TextEditingController();
  final monthEC = TextEditingController();
  final yaerEC = TextEditingController();
  final monthsRecurrenceEC = TextEditingController();
  final tenantEC = TextEditingController();
  final documentTenantEC = TextEditingController();
  final locatorEC = TextEditingController();
  final documentlocatortEC = TextEditingController();
  final streetEC = TextEditingController();
  final complementEC = TextEditingController();
  final numberEC = TextEditingController();
  final neighborhoodEC = TextEditingController();
  final propertyTypeEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();
  final zipCodeEC = TextEditingController();
  final observationEC = TextEditingController();
  final dateEC = TextEditingController();

  void formDispose() {
    valueEC.dispose();
    monthEC.dispose();
    yaerEC.dispose();
    monthsRecurrenceEC.dispose();
    tenantEC.dispose();
    documentTenantEC.dispose();
    locatorEC.dispose();
    documentlocatortEC.dispose();
    streetEC.dispose();
    complementEC.dispose();
    numberEC.dispose();
    neighborhoodEC.dispose();
    propertyTypeEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    zipCodeEC.dispose();
    observationEC.dispose();
    dateEC.dispose();
  }

  void formReset() {
    valueEC.clear();
    monthEC.clear();
    yaerEC.clear();
    monthsRecurrenceEC.clear();
    tenantEC.clear();
    documentTenantEC.clear();
    locatorEC.clear();
    documentlocatortEC.clear();
    streetEC.clear();
    complementEC.clear();
    numberEC.clear();
    neighborhoodEC.clear();
    propertyTypeEC.clear();
    cityEC.clear();
    stateEC.clear();
    zipCodeEC.clear();
    observationEC.clear();
    dateEC.clear();
  }

  FormModel save() {
    return FormModel(
      value: int.parse(valueEC.text),
      month: int.parse(monthEC.text),
      yaer: int.parse(yaerEC.text),
      monthsRecurrence: int.parse(monthsRecurrenceEC.text),
      tenant: tenantEC.text,
      documentTenant: documentTenantEC.text,
      locator: locatorEC.text,
      documentlocatort: documentlocatortEC.text,
      street: streetEC.text,
      complement: complementEC.text,
      number: int.parse(numberEC.text),
      neighborhood: neighborhoodEC.text,
      propertyType: propertyTypeEC.text,
      city: cityEC.text,
      state: stateEC.text,
      zipCode: int.parse(zipCodeEC.text),
      observation: observationEC.text,
      date: dateEC.text,
      twoWay: false,
      payment: Dinheiro(),
    );
  }
}
