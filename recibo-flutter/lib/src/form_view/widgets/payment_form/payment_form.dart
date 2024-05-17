import 'package:flutter/material.dart';
import 'package:recibo/src/form_view/widgets/payment_form/payment_form_controller.dart';
import 'package:recibo/src/model/payment_type.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final controller = PaymentFormController();
  @override
  Widget build(BuildContext context) {
    return Watch(
      (_) => Wrap(
        children: [
          _Payment(
            value: controller.dinheiro,
            onChanged: (value) {
              controller.dinheiroChanged(value ?? false);
            },
            title: "Dinheiro",
          ),
          _Payment(
            value: controller.pix,
            onChanged: (value) {
              controller.pixChanged(value ?? false);
            },
            title: "Pix",
          ),
          _Payment(
            value: controller.cheque,
            onChanged: (value) {
              controller.chequeChanged(value ?? false);
            },
            title: "Cheque",
          ),
          _Payment(
            value: controller.deposito,
            onChanged: (value) {
              controller.depositoChanged(value ?? false);
            },
            title: "Transferência/Depósito",
          ),
          const SizedBox(width: double.infinity),
          Watch((_) => switch (controller.paymentType) {
                PaymentType.dinheiro => const Text("Dinheiro"),
                PaymentType.pix => const Text("Pix"),
                PaymentType.cheque => const Text("Cheque"),
                PaymentType.deposito => const Text("Depósito"),
              }),
        ],
      ),
    );
  }
}

class _Payment extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String title;

  const _Payment({
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Center(child: Text(title)),
        ],
      ),
    );
  }
}
