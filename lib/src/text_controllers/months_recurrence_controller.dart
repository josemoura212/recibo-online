import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class MonthsRecurrenceController extends FormController {
  MonthsRecurrenceController(super.context);

  @override
  String? Function(String? value)? get validator =>
      Validatorless.max(12, 'Valor máximo é 12');

  @override
  List<String> get formaters => ['##'];

  @override
  RegExp get regexFilter => RegExp(r"^\d{1,2}$");

  @override
  TextInputType get textInputType => TextInputType.number;
}
