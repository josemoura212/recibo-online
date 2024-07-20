import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class YearController extends FormController {
  YearController(super.context);

  @override
  String? Function(String? value)? get validator =>
      Validatorless.required('Campo obrigatório');

  @override
  List<String> get formaters => ['####'];

  @override
  RegExp get regexFilter => RegExp(r"^\d{4}");

  @override
  TextInputType get textInputType => TextInputType.number;
}
