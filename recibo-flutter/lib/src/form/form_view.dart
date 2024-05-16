import 'package:flutter/material.dart';
import 'package:recibo/src/form/widgets/form_controller.dart';
import 'package:recibo/src/form/widgets/selected_month_widget.dart';
import 'package:recibo/src/form/widgets/selected_state_widget.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> with FormController {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final selectedMonth = date.month;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(45),
              child: Center(
                child: Text(
                  "Recibo de Aluguel",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 12,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 70,
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: valueEC,
                        decoration: const InputDecoration(
                          label: Text("Valor"),
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SelectedMonthWidget(
                        monthEC: monthEC, selectedMonth: selectedMonth),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: yaerEC,
                        decoration: const InputDecoration(
                          label: Text("Ano"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        controller: monthsRecurrenceEC,
                        decoration: const InputDecoration(
                          label: Text("Meses de Recorrencia"),
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 450,
                      child: TextFormField(
                        controller: tenantEC,
                        decoration: const InputDecoration(
                          label: Text("Locatário(a):"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: documentTenantEC,
                        decoration: const InputDecoration(
                          label: Text("CPF ou CNPJ (opcional):"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 450,
                      child: TextFormField(
                        controller: locatorEC,
                        decoration: const InputDecoration(
                          label: Text("Locador(a):"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: documentlocatortEC,
                        decoration: const InputDecoration(
                          label: Text("CPF ou CNPJ (opcional):"),
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    const Text(
                      "ENDEREÇO DO IMÓVEL LOCADO:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 450,
                      child: TextFormField(
                        controller: streetEC,
                        decoration: const InputDecoration(
                          label: Text("Rua"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: complementEC,
                        decoration: const InputDecoration(
                          label: Text("Complemento: (opcional)"),
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: numberEC,
                        decoration: const InputDecoration(
                          label: Text("Numero"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: neighborhoodEC,
                        decoration: const InputDecoration(
                          label: Text("Bairro"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: propertyTypeEC,
                        decoration: const InputDecoration(
                          label: Text("Tipo Imóvel:"),
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: cityEC,
                        decoration: const InputDecoration(
                          label: Text("Cidade:"),
                        ),
                      ),
                    ),
                    SelectedStateWidget(stateEC: stateEC),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        controller: zipCodeEC,
                        decoration: const InputDecoration(
                          label: Text("CEP"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: observationEC,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          label: Text("Observação: (opcional)"),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Forma de Pagamento:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text("Dinheiro"),
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text("Pix"),
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text("Cheque"),
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text("Transferência/Depósito"),
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text("Cartão de Crédito/Débito"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: zipCodeEC,
                        decoration: const InputDecoration(
                          label: Text("Data de emissão"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                    ),
                    SizedBox(
                      width: 200,
                      child: CheckboxListTile.adaptive(
                        title: const Text("Duas Vias?"),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Gerar Recibo",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
