import 'package:flutter/material.dart';

class SelectedMonthWidget extends StatelessWidget {
  final TextEditingController monthEC;
  final int selectedMonth;

  const SelectedMonthWidget({
    super.key,
    required this.monthEC,
    required this.selectedMonth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownMenu(
        initialSelection: selectedMonth,
        controller: monthEC,
        label: const Text(
          "Mês de Referência",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 1, label: "Janeiro"),
          DropdownMenuEntry(value: 2, label: "Fevereiro"),
          DropdownMenuEntry(value: 3, label: "Março"),
          DropdownMenuEntry(value: 4, label: "Abril"),
          DropdownMenuEntry(value: 5, label: "Maio"),
          DropdownMenuEntry(value: 6, label: "Junho"),
          DropdownMenuEntry(value: 7, label: "Julho"),
          DropdownMenuEntry(value: 8, label: "Agosto"),
          DropdownMenuEntry(value: 9, label: "Setembro"),
          DropdownMenuEntry(value: 10, label: "Outubro"),
          DropdownMenuEntry(value: 11, label: "Novembro"),
          DropdownMenuEntry(value: 12, label: "Dezembro"),
        ],
      ),
    );
  }
}
