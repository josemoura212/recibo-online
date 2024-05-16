import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
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
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: Wrap(
                  spacing: 45,
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Valor",
                        ),
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Valor",
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
