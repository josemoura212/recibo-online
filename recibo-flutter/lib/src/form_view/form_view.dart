import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:recibo/src/core/helpers/helpers.dart';
import 'package:recibo/src/form_view/form_view_controller.dart';
import 'package:recibo/src/form_view/form_text_controller.dart';
import 'package:recibo/src/form_view/widgets/payment_form/payment_form.dart';
import 'package:recibo/src/form_view/widgets/selected_month_widget.dart';
import 'package:recibo/src/form_view/widgets/selected_state_widget.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> with FormTextController {
  final controller = FormViewController();

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    dateEC.text =
        "${date.day}/${date.month.toString().padLeft(2, "0")}/${date.year}";
  }

  @override
  void dispose() {
    formDispose();
    super.dispose();
  }

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
            child: Form(
              key: formKey,
              child: Card(
                elevation: 12,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
                          onTapOutside: (event) => context.unFocus(),
                          inputFormatters: [
                            MaskTextInputFormatter(
                              initialText: "000,00",
                              mask: "###.###.###,##",
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                          validator:
                              Validatorless.required("Campo obrigatório"),
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
                          onTapOutside: (event) => context.unFocus(),
                          controller: yaerEC,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: "####",
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Ano"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
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
                          onTapOutside: (event) => context.unFocus(),
                          controller: tenantEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Locatário(a):"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: documentTenantEC,
                          decoration: const InputDecoration(
                            label: Text("CPF ou CNPJ (opcional):"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 450,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: locatorEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Locador(a):"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
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
                          onTapOutside: (event) => context.unFocus(),
                          controller: streetEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Rua"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
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
                          onTapOutside: (event) => context.unFocus(),
                          controller: numberEC,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: "#####",
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Numero"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: neighborhoodEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Bairro"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: propertyTypeEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Tipo Imóvel:"),
                          ),
                        ),
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: cityEC,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Cidade:"),
                          ),
                        ),
                      ),
                      SelectedStateWidget(stateEC: stateEC),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: zipCodeEC,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: "#####-###",
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("CEP"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: observationEC,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            label: Text("Observação: (opcional)"),
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Forma de Pagamento:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PaymentForm()
                        ],
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          onTapOutside: (event) => context.unFocus(),
                          controller: dateEC,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: "##/##/####",
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: const InputDecoration(
                            label: Text("Data de emissão"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Watch(
                        (_) => SizedBox(
                          width: 200,
                          child: CheckboxListTile.adaptive(
                            dense: false,
                            title: const Text("Duas Vias?"),
                            value: controller.twoWay,
                            onChanged: (value) {
                              controller.twoWayChanged(value ?? false);
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          final valid =
                              formKey.currentState?.validate() ?? false;

                          if (valid) {
                            final pdf = pw.Document();

                            pdf.addPage(pw.Page(
                                pageFormat: PdfPageFormat.a4,
                                build: (pw.Context context) {
                                  return pw.Center(
                                    child: pw.Text("Recibo de Aluguel"),
                                  );
                                }));

                            var savedFile = await pdf.save();
                            List<int> fileInts = List.from(savedFile);
                            final date = DateTime.now();
                            html.AnchorElement(
                                href:
                                    "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
                              ..setAttribute("download",
                                  "recibo ${date.day}-${date.month}-${date.year}.pdf")
                              ..click();

                            formReset();
                          }
                        },
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
            ),
          )
        ],
      ),
    );
  }
}
