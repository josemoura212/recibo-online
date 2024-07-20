import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:recibo/src/core/helpers/formatter_coin.dart';
import 'package:recibo/src/core/helpers/formatter_cpf_or_cpnj.dart';
import 'package:recibo/src/form_view/widgets/auto_text_form_field_widget.dart';
import 'package:recibo/src/services/pdf.dart';
import 'package:recibo/src/text_controllers/city_controller.dart';
import 'package:recibo/src/text_controllers/complement_controller.dart';
import 'package:recibo/src/text_controllers/document_locator_controller.dart';
import 'package:recibo/src/text_controllers/document_tenant_controller.dart';
import 'package:recibo/src/text_controllers/locator_controller.dart';
import 'package:recibo/src/text_controllers/months_recurrence_controller.dart';
import 'package:recibo/src/text_controllers/neighborhood_controller.dart';
import 'package:recibo/src/text_controllers/number_controller.dart';
import 'package:recibo/src/text_controllers/property_type_controller.dart';
import 'package:recibo/src/text_controllers/street_controller.dart';
import 'package:recibo/src/text_controllers/tentant_controller.dart';
import 'package:recibo/src/text_controllers/value_controller.dart';
import 'package:recibo/src/text_controllers/year_controller.dart';
import 'package:recibo/src/text_controllers/zip_code_controller.dart';
import '../core/helpers/helpers.dart';
import 'form_view_controller.dart';
import 'form_text_controller.dart';
import 'widgets/payment_form/payment_form.dart';
import 'widgets/selected_month_widget.dart';
import 'widgets/selected_state_widget.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

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
                        child: AutoTextFormFieldWidget(
                          inputFormatters: [CustomTextInputFormatter()],
                          label: "Valor",
                          formController: ValueController(context),
                          onChanged: (p0) => value = p0,
                        ),
                      ),
                      // const SizedBox(width: double.infinity),
                      SelectedMonthWidget(
                        monthEC: monthEC,
                        selectedMonth: selectedMonth,
                      ),
                      SizedBox(
                        width: 100,
                        child: AutoTextFormFieldWidget(
                          label: 'Ano',
                          formController: YearController(context),
                          onChanged: (p0) => year = p0,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: AutoTextFormFieldWidget(
                          label: 'Meses de Recorrencia',
                          formController: MonthsRecurrenceController(context),
                          onChanged: (p0) => monthsRecurrence = p0,
                        ),
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 450,
                        child: AutoTextFormFieldWidget(
                          label: 'Locatário(a)',
                          formController: TentantController(context),
                          onChanged: (p0) => tenant = p0,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: AutoTextFormFieldWidget(
                          label: 'CPF ou CNPJ (opcional)',
                          inputFormatters: [FormatterCpfOrCpnj()],
                          formController: DocumentTenantController(context),
                          onChanged: (p0) => documentTenant = p0,
                        ),
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 450,
                        child: AutoTextFormFieldWidget(
                          label: 'Locador(a)',
                          formController: LocatorController(context),
                          onChanged: (p0) => locator = p0,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: AutoTextFormFieldWidget(
                          formController: DocumentLocatorController(context),
                          label: 'CPF ou CNPJ (opcional)',
                          inputFormatters: [FormatterCpfOrCpnj()],
                          onChanged: (p0) => documentLocator = p0,
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
                        width: 150,
                        child: AutoTextFormFieldWidget(
                          label: 'CEP',
                          formController: ZipCodeController(context),
                          onChanged: (p0) => zipCode = p0,
                        ),
                      ),
                      SizedBox(
                        width: 450,
                        child: AutoTextFormFieldWidget(
                          label: 'Rua',
                          formController: StreetController(context),
                          onChanged: (p0) => street = p0,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: AutoTextFormFieldWidget(
                          label: 'Complemento',
                          formController: ComplementController(context),
                          onChanged: (p0) => complement = p0,
                        ),
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 100,
                        child: AutoTextFormFieldWidget(
                          label: 'Número',
                          formController: NumberController(context),
                          onChanged: (p0) => number = p0,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: AutoTextFormFieldWidget(
                          label: 'Bairro',
                          formController: NeighborhoodController(context),
                          onChanged: (p0) => neighborhood = p0,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: AutoTextFormFieldWidget(
                          label: 'Tipo de Imóvel',
                          formController: PropertyTypeController(context),
                          onChanged: (p0) => propertyType = p0,
                        ),
                      ),
                      const SizedBox(width: double.infinity),
                      SizedBox(
                        width: 250,
                        child: AutoTextFormFieldWidget(
                          label: 'Cidade',
                          formController: CityController(context),
                          onChanged: (p0) => city = p0,
                        ),
                      ),
                      SelectedStateWidget(stateEC: stateEC),

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
                            final pdf = Pdf();
                            final generate = await pdf.generatePdfDocument(
                              month: monthEC.text,
                              year: year,
                              value: value,
                              tenant: tenant,
                              documentTenant: documentTenant,
                              locator: locator,
                              documentLocator: documentLocator,
                              street: street,
                              number: number,
                              complement: complement,
                              neighborhood: neighborhood,
                              city: city,
                              state: stateEC.text,
                              zipCode: zipCode,
                            );

                            pdf.savePdfFile(generate);

                            // // formReset();
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
