import 'package:flutter/material.dart';

extension Unfocus on BuildContext {
  void unFocus() => FocusScope.of(this).unfocus();
}
