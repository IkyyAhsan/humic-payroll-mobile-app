import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportScreenController extends GetxController {
  final TextEditingController fileType = TextEditingController();
  // Variabel yang mengontrol apakah "Realization" atau "Transaction" yang aktif
  var isRealization = true.obs;

  // Fungsi untuk memindah Screen ke Realization
  void toggleRealization() {
    isRealization.value = true;
  }

  // Fungsi untuk memindah Screen ke Transaction
  void toggleTransaction() {
    isRealization.value = false;
  }
}
