import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportScreenController extends GetxController {
  final TextEditingController fileType = TextEditingController();
  // Variabel yang mengontrol apakah "Realization" atau "Transaction" yang aktif
  var isItems = true.obs;

  // Fungsi untuk memindah Screen ke Realization
  void toggleItems() {
    isItems.value = true;
  }

  // Fungsi untuk memindah Screen ke Transaction
  void toggleTransaction() {
    isItems.value = false;
  }
}
