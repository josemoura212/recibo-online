import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';

class DocumentLocatorController extends FormController {
  DocumentLocatorController(super.context);

  @override
  RegExp get regexFilter => RegExp(r'[0-9]');

  @override
  TextInputType get textInputType => TextInputType.number;
}
