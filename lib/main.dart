import 'package:flutter/material.dart';
import 'src/core/ui/ui_config.dart';
import 'src/form_view/form_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FormView(),
      debugShowCheckedModeBanner: false,
      theme: UiConfig.themeData,
      title: "Recibo de Aluguel",
    );
  }
}
