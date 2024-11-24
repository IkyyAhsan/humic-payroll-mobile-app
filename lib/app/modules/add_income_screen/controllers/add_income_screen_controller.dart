// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/income.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class AddIncomeScreenController extends GetxController {
  DateTime currentDate = DateTime.now();
  final TextEditingController namaKegiatan = TextEditingController();
  final TextEditingController tanggalKegiatan = TextEditingController();
  final TextEditingController pemasukanKegiatan = TextEditingController();
  final TextEditingController pajakKegiatan = TextEditingController();
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
      tanggalKegiatan.text = formattedDate;
      currentDate = selectedDate;
    }
  }

  void addUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      uploadFile = file;
    } else {
      Get.snackbar(
        "No File Selected",
        "You did not select any file. Please try again.",
        icon: const Icon(Icons.info_outline, color: HumiColors.humicWhiteColor),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HumiColors.humicPrimaryColor,
        colorText: HumiColors.humicWhiteColor,
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
          icon: const Icon(Icons.error_outline,
              color: HumiColors.humicWhiteColor),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: HumiColors.humicPrimaryColor,
          colorText: HumiColors.humicWhiteColor,
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
        icon: const Icon(Icons.info_outline, color: HumiColors.humicWhiteColor),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HumiColors.humicPrimaryColor,
        colorText: HumiColors.humicWhiteColor,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }
    update();
  }

  void addIncome() async {
    Income income = Income(
      name: namaKegiatan.text,
      date: currentDate,
      amount: int.parse(pemasukanKegiatan.text),
      taxAmount: int.parse(pajakKegiatan.text),
      documentEvidence: evidence,
      imageEvidence: uploadFile,
      transactionType: "income",
    );
    print(await ApprovalServices().postIncomeData(income));
  }
}
