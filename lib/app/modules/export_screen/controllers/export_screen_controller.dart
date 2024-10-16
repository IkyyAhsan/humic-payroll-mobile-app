import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportScreenController extends GetxController {
  void getPDF() async {
    final pdf = pw.Document();

    // Buat Page
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "LAPORAN PEMASUKAN HUMIC",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]);
        },
      ),
    );

    // Menyimpan PDF
    Uint8List bytes = await pdf.save();

    // buat file kosong di directory
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/Laporan Bulanan HUMiC.pdf');

    //menimpa file kosong dengan file pdf
    await file.writeAsBytes(bytes);

    //open PDF
    await OpenFile.open(file.path);
  }
}
