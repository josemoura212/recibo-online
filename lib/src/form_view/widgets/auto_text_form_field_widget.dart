import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:recibo/src/core/helpers/helpers.dart';

class AutoTextFormFieldWidget extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final FormController formController;
  final void Function(String)? onChanged;

  const AutoTextFormFieldWidget({
    super.key,
    this.inputFormatters,
    required this.label,
    required this.formController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTextFormField(
      inputFormatters: inputFormatters,
      onTapOutside: (event) => context.unFocus(),
      decoration: InputDecoration(
        labelText: label,
      ),
      formController: formController,
      onChanged: onChanged,
    );
  }
}
