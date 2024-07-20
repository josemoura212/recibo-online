import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:validatorless/validatorless.dart';

class ValueController extends FormController {
  ValueController(super.context);

  @override
  String? Function(String? value)? get validator =>
      Validatorless.required('Campo obrigatório');

  @override
  RegExp get regexFilter => RegExp(r"^\d{3}\.");

  @override
  TextInputType get textInputType => TextInputType.number;
}
