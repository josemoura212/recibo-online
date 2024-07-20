import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ZipCodeController extends FormController {
  ZipCodeController(super.context);

  @override
  String? Function(String? value)? get validator => Validatorless.multiple([
        Validatorless.required('Campo obrigatório'),
        Validatorless.min(8, 'CEP inválido'),
        Validatorless.max(8, 'CEP inválido'),
      ]);

  @override
  List<String> get formaters => ['#####-###'];

  @override
  RegExp get regexFilter => RegExp(r"^\d{5}-\d{3}$");

  @override
  TextInputType get textInputType => TextInputType.number;
}
