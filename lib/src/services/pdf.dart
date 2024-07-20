import 'dart:convert';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;

class Pdf {
  Future<pw.Document> generatePdfDocument({
    required final String month,
    required final String year,
    required final String value,
    required final String tenant,
    final String? documentTenant,
    required final String locator,
    final String? documentLocator,
    required final String street,
    required final String number,
    required final String complement,
    required final String neighborhood,
    required final String city,
    required final String state,
    required final String zipCode,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "Recibo de Aluguel",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "MÊS DE REFERÊNCIA",
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.Text(
                        "${month.toUpperCase()}/$year",
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(
                        "VALOR EM R\$",
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.Text(
                        value,
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Locatário(a):",
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        tenant,
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.Text(
                        "CPF ou CNPJ: $documentTenant",
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Locador(a):",
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        locator,
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.Text(
                        "CPF ou CNPJ: $documentLocator",
                        style: const pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "ENDEREÇO DO IMÓVEL LOCADO:",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    "$street, $number ($complement), -  $neighborhood - $city - $state CEP: $zipCode",
                    style: const pw.TextStyle(
                      fontSize: 14,
                      color: PdfColors.grey,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Divider(color: PdfColors.grey),
                  pw.SizedBox(height: 5),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  void savePdfFile(pw.Document pdf) async {
    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    final date = DateTime.now();
    html.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute(
          "download", "recibo ${date.day}-${date.month}-${date.year}.pdf")
      ..click();
  }
}
