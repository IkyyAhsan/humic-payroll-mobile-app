import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/expense.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';
import 'package:intl/intl.dart';

class AddExpensesScreenController extends GetxController {
  DateTime currentDate = DateTime.now();
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController taxAmount = TextEditingController();
  final TextEditingController date = TextEditingController();
  File? uploadFile;
  File? evidence;

  void selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      date.text = formattedDate;
      currentDate = selectedDate;
    }
  }

  void addUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType
          .image, // Ubah ke FileType.image untuk menangkap semua file gambar
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      // Ekstensi otomatis valid karena FileType.image sudah membatasi file ke gambar
      uploadFile = file;
    } else {
      // User canceled the picker
      Get.snackbar(
        "No File Selected",
        "You did not select any file. Please try again.",
        icon: const Icon(Icons.info_outline, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }
    update();
  }

  void addEvidence() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'xlsx'],
      type: FileType.custom,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      // Validate file extension
      if (!['pdf', 'xlsx']
          .contains(result.files.single.extension?.toLowerCase())) {
        Get.snackbar(
          "Invalid File Format",
          "Only PDF and XLSX file types are allowed. Please try again.",
          icon: const Icon(Icons.error_outline, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
          duration: const Duration(seconds: 3),
        );
        return;
      }
      evidence = file;
    } else {
      // User canceled the picker
      Get.snackbar(
        "No File Selected",
        "You did not select any file. Please try again.",
        icon: const Icon(Icons.info_outline, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }
    update();
  }

  void addExpense() async {
    Expense expense = Expense(
      name: name.text,
      date: currentDate,
      amount: int.parse(amount.text),
      taxAmount: int.parse(taxAmount.text),
      documentEvidence: evidence,
      imageEvidence: uploadFile,
      transactionType: "expense",
    );
    print(await ApprovalServices().postExpenseData(expense));
  }
}
