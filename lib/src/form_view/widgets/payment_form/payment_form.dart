import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import 'payment_form_controller.dart';
import '../../../model/payment_type.dart';

class PaymentForm extends StatefulWidget {
  final VoidCallback? onChanged;
  const PaymentForm({
    super.key,
    this.onChanged,
  });

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> with FormPaymentController {
  @override
  void dispose() {
    formDispose();
    super.dispose();
  }

  final controller = PaymentFormController();

  Payment getPayment() {
    switch (controller.paymentType) {
      case PaymentType.dinheiro:
        return Dinheiro();
      case PaymentType.pix:
        return Pix(
          pixKey: pixKeyEC.text,
          received: pixRecivieEC.text,
          bank: pixBankEC.text,
        );
      case PaymentType.cheque:
        return Cheque(
          numeroDoCheque: checkNumberEC.text,
          banco: checkBankEC.text,
          agencia: checkAgencyEC.text,
          bomPara: checkGoodForEC.text,
        );
      case PaymentType.deposito:
        return Deposito(
          conta: depositAccountEC.text,
          agencia: depositAgencyEC.text,
          data: depositDateEC.text,
          banco: depositBankEC.text,
          favorecido: depositFavoredEC.text,
          numeroDoDocumento: depositDocumentNumberEC.text,
        );
      case PaymentType.cartao:
        return Cartao();
    }
  }

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
          _Payment(
            value: controller.cartao,
            onChanged: (value) {
              controller.cartaoChanged(value ?? false);
            },
            title: "Cartão de Crédito/Débito",
          ),
          const SizedBox(width: double.infinity),
          Watch((_) => switch (controller.paymentType) {
                PaymentType.dinheiro => const SizedBox.shrink(),
                PaymentType.pix => _Pix(),
                PaymentType.cheque => _Cheque(),
                PaymentType.deposito => _Deposito(),
                PaymentType.cartao => const Text("Cartão"),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          onChanged?.call(!value);
        },
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              splashRadius: 0,
            ),
            Center(child: Text(title)),
          ],
        ),
      ),
    );
  }
}

class _Pix extends StatelessWidget with FormPaymentController {
  _Pix();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Wrap(
        spacing: 70,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: pixRecivieEC,
              decoration: const InputDecoration(labelText: "Quem recebeu:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: pixBankEC,
              decoration:
                  const InputDecoration(labelText: "Instituição/Banco:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: pixKeyEC,
              decoration: const InputDecoration(labelText: "Chave:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
        ],
      ),
    );
  }
}

class _Cheque extends StatelessWidget with FormPaymentController {
  _Cheque();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Wrap(
        spacing: 70,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: checkNumberEC,
              decoration: const InputDecoration(labelText: "Nº do Cheque:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: checkBankEC,
              decoration: const InputDecoration(labelText: "Banco:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: checkAgencyEC,
              decoration: const InputDecoration(labelText: "Agência:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: checkGoodForEC,
              decoration: const InputDecoration(labelText: "Bom para..."),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
        ],
      ),
    );
  }
}

class _Deposito extends StatelessWidget with FormPaymentController {
  _Deposito();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Wrap(
        spacing: 70,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositAccountEC,
              decoration: const InputDecoration(labelText: "Conta:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositAgencyEC,
              decoration: const InputDecoration(labelText: "Agência:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositDateEC,
              decoration: const InputDecoration(labelText: "Data:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositBankEC,
              decoration: const InputDecoration(labelText: "Banco:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositFavoredEC,
              decoration: const InputDecoration(labelText: "Favorecido:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: depositDocumentNumberEC,
              decoration: const InputDecoration(labelText: "Nº do documento:"),
              validator: Validatorless.required("Campo obrigatório"),
            ),
          ),
        ],
      ),
    );
  }
}

mixin FormPaymentController {
  final formKey = GlobalKey<FormState>();

  final pixRecivieEC = TextEditingController();
  final pixBankEC = TextEditingController();
  final pixKeyEC = TextEditingController();

  final checkNumberEC = TextEditingController();
  final checkBankEC = TextEditingController();
  final checkAgencyEC = TextEditingController();
  final checkGoodForEC = TextEditingController();

  final depositAccountEC = TextEditingController();
  final depositAgencyEC = TextEditingController();
  final depositDateEC = TextEditingController();
  final depositBankEC = TextEditingController();
  final depositFavoredEC = TextEditingController();
  final depositDocumentNumberEC = TextEditingController();

  void formDispose() {
    pixRecivieEC.dispose();
    pixBankEC.dispose();
    pixKeyEC.dispose();

    checkNumberEC.dispose();
    checkBankEC.dispose();
    checkAgencyEC.dispose();
    checkGoodForEC.dispose();

    depositAccountEC.dispose();
    depositAgencyEC.dispose();
    depositDateEC.dispose();
    depositBankEC.dispose();
    depositFavoredEC.dispose();
    depositDocumentNumberEC.dispose();
  }

  void formReset() {
    pixRecivieEC.clear();
    pixBankEC.clear();
    pixKeyEC.clear();

    checkNumberEC.clear();
    checkBankEC.clear();
    checkAgencyEC.clear();
    checkGoodForEC.clear();

    depositAccountEC.clear();
    depositAgencyEC.clear();
    depositDateEC.clear();
    depositBankEC.clear();
    depositFavoredEC.clear();
    depositDocumentNumberEC.clear();
  }

  Pix savePix() {
    return Pix(
      pixKey: pixKeyEC.text,
      received: pixRecivieEC.text,
      bank: pixBankEC.text,
    );
  }

  Cheque saveCheque() {
    return Cheque(
      numeroDoCheque: checkNumberEC.text,
      banco: checkBankEC.text,
      agencia: checkAgencyEC.text,
      bomPara: checkGoodForEC.text,
    );
  }

  Deposito saveDeposito() {
    return Deposito(
      conta: depositAccountEC.text,
      agencia: depositAgencyEC.text,
      data: depositDateEC.text,
      banco: depositBankEC.text,
      favorecido: depositFavoredEC.text,
      numeroDoDocumento: depositDocumentNumberEC.text,
    );
  }
}
