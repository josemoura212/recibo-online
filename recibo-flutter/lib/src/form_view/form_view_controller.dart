import 'package:recibo/src/model/form_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FormViewController {
  final _twoWay = signal<bool>(false);

  bool get twoWay => _twoWay.value;

  void twoWayChanged(bool value) {
    _twoWay.value = value;
  }

  void save() async {
    final receipt = FormModel(
      value: 800,
      month: 5,
      yaer: 2024,
      monthsRecurrence: 1,
      tenant: "Reimivon Nunes de Moura",
      locator: "Maria Lucia Rodrigues Santos",
      street: "Rua barao do bananal",
      number: 0,
      complement: "Q51 lt14 casa 1",
      neighborhood: "Parque Real",
      propertyType: "Residencial",
      city: "Aparecida de Goiania",
      state: "Goias",
      zipCode: 74910020,
      date: "2024-05-01",
      twoWay: false,
      payment: Pix(
        key: "123456789",
        received: "Reimivon Nunes de Moura",
        bank: "NuBank",
      ),
    );
  }
}
