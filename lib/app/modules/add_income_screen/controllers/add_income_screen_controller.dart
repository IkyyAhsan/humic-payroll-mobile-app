import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/income.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';

class AddIncomeScreenController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final currentDate = DateTime.now().obs;
  final TextEditingController namaKegiatan = TextEditingController();
  final TextEditingController tanggalKegiatan = TextEditingController();
  final TextEditingController pemasukanKegiatan = TextEditingController();
  final TextEditingController pajakKegiatan = TextEditingController();
  File? documentEvidence;
  File? imageEvidence;
  final bottomNavbarController = Get.put(BottomNavigationBarController());

  void changeStartDate() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(
        2101,
      ),
    );
    if (date != null) {
      tanggalKegiatan.text = formatDate(date);
      selectedDate.value = date;
    }
  }

  void addUploadImageEvidence() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      imageEvidence = file;
    } else {
      Get.snackbar(
        "No File Selected",
        "You did not select any file. Please try again.",
        icon: const Icon(
          Icons.info_outline,
          color: HumiColors.humicWhiteColor,
        ),
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

  void addUploadDocumentEvidence() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'xlsx'],
      type: FileType.custom,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
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
      documentEvidence = file;
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
      date: selectedDate.value,
      amount: int.parse(pemasukanKegiatan.text),
      taxAmount: int.parse(pajakKegiatan.text),
      documentEvidence: documentEvidence,
      imageEvidence: imageEvidence,
      transactionType: "income",
    );
    // print(income.date);
    print(await ApprovalServices().postIncomeData(income));
    print(selectedDate.value);
    update();
    bottomNavbarController.changeIndex(1);
    Get.to(() => const BottomNavigationBarView());
    final navbarController = Get.put(BottomNavigationBarController());
    navbarController.changeIndex(3);

    Get.snackbar(
      "Income Added",
      "The income has been successfully added.",
      colorText: HumiColors.humicWhiteColor,
      backgroundColor: HumiColors.humicSecondaryColor,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void dispose() {
    namaKegiatan.clear();
    tanggalKegiatan.clear();
    pemasukanKegiatan.clear();
    pajakKegiatan.clear();
    documentEvidence = null;
    imageEvidence = null;
    super.dispose();
  }
}
