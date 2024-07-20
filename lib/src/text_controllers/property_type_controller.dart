
import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PropertyTypeController extends FormController {
  PropertyTypeController(super.context);

  @override
  String? Function(String? value)? get validator =>
      Validatorless.required('Campo obrigatório');

  @override
  TextInputType get textInputType => TextInputType.text;
  
}