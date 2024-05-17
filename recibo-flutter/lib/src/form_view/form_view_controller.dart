import 'package:signals_flutter/signals_flutter.dart';

class FormViewController {
  final _twoWay = signal<bool>(false);

  bool get twoWay => _twoWay.value;

  void twoWayChanged(bool value) {
    _twoWay.value = value;
  }
}
