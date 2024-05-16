import 'package:flutter/material.dart';

class SelectedStateWidget extends StatelessWidget {
  final TextEditingController stateEC;
  const SelectedStateWidget({
    super.key,
    required this.stateEC,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownMenu(
        initialSelection: 1,
        controller: stateEC,
        label: const Text(
          "Mês de Referência",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 1, label: "Acre"),
          DropdownMenuEntry(value: 2, label: "Alagoas"),
          DropdownMenuEntry(value: 3, label: "Amapá"),
          DropdownMenuEntry(value: 4, label: "Amazonas"),
          DropdownMenuEntry(value: 5, label: "Bahia"),
          DropdownMenuEntry(value: 6, label: "Ceará"),
          DropdownMenuEntry(value: 7, label: "Distrito Federal"),
          DropdownMenuEntry(value: 8, label: "Espírito Santo"),
          DropdownMenuEntry(value: 9, label: "Goiás"),
          DropdownMenuEntry(value: 10, label: "Maranhão"),
          DropdownMenuEntry(value: 11, label: "Mato Grosso"),
          DropdownMenuEntry(value: 12, label: "Mato Grosso do Sul"),
          DropdownMenuEntry(value: 13, label: "Minas Gerais"),
          DropdownMenuEntry(value: 14, label: "Pará"),
          DropdownMenuEntry(value: 15, label: "Paraíba"),
          DropdownMenuEntry(value: 16, label: "Paraná"),
          DropdownMenuEntry(value: 17, label: "Pernambuco"),
          DropdownMenuEntry(value: 18, label: "Piauí"),
          DropdownMenuEntry(value: 19, label: "Rio de Janeiro"),
          DropdownMenuEntry(value: 20, label: "Rio Grande do Norte"),
          DropdownMenuEntry(value: 21, label: "Rio Grande do Sul"),
          DropdownMenuEntry(value: 22, label: "Rondônia"),
          DropdownMenuEntry(value: 23, label: "Roraima"),
          DropdownMenuEntry(value: 24, label: "Santa Catarina"),
          DropdownMenuEntry(value: 25, label: "São Paulo"),
          DropdownMenuEntry(value: 26, label: "Sergipe"),
          DropdownMenuEntry(value: 27, label: "Tocantins"),
        ],
      ),
    );
  }
}
