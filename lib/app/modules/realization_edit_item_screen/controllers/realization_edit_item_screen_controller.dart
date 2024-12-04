import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_screen/controllers/realization_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/add_planning_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/short_file_name.dart';

import '../../../data/models/input/show_realization.dart';

class RealizationEditItemScreenController extends GetxController {
  final selectedDate = DateTime.now().obs;

  final id = Get.arguments['id'];
  final TextEditingController tanggalItem = TextEditingController();
  final TextEditingController keteranganItem = TextEditingController();
  final TextEditingController nilaiBrutoItem = TextEditingController();
  final TextEditingController nilaiPajakItem = TextEditingController();
  final TextEditingController nilaiNettoItem = TextEditingController();
  final TextEditingController kategoriItem = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  File? documentEvidence;
  File? imageEvidence;

  @override
  void onInit() {
    loadEdit();
    super.onInit();
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

  void changeTanggalItem() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(
        2101,
      ),
    );
    if (date != null) {
      tanggalItem.text = formatDate(date);
    }
    selectedDate.value = date ?? DateTime.now();
  }

  void changeDate() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(
        2101,
      ),
    );
    if (date != null) {
      tanggalItem.text = formatDate(date);
    }
    selectedDate.value = date ?? DateTime.now();
  }

  void addItem() async {
    print('Document Evidence: $documentEvidence');
    print('Image Evidence: $imageEvidence');

    if (await AddItemServices().editItemPlanning(
      id: Get.arguments['data'].id,
      item: AddItem(
        planningId: Get.arguments['id'],
        date: selectedDate.value,
        information: keteranganItem.text,
        brutoAmount: int.parse(nilaiBrutoItem.text),
        taxAmount: int.parse(nilaiPajakItem.text),
        nettoAmount: int.parse(nilaiNettoItem.text),
        category: kategoriItem.text,
        isAddition: 1,
        documentEvidence: documentEvidence,
        imageEvidence: imageEvidence,
      ),
    )) {
      Get.offAllNamed(Routes.REALIZATION_EDIT_SCREEN, arguments: {
        "id": id,
      });
      final realizationController = RealizationScreenController();
      realizationController.getRealizationData();
    } else {
      print(false);
    }
  }

  loadEdit() {
    Item data = Get.arguments['data'];
    endDate.text = formatDate(data.createdAt);
    keteranganItem.text = data.information ?? "";
    nilaiBrutoItem.text = "${data.brutoAmount}";
    nilaiPajakItem.text = "${data.taxAmount}";
    nilaiNettoItem.text = "${data.nettoAmount}";
    kategoriItem.text = data.category ?? "";

    // Debugging log
    print("Document Evidence Path: ${data.documentEvidence}");
    print("Image Evidence Path: ${data.imageEvidence}");

    documentEvidence = data.documentEvidence != null
        ? File(data.documentEvidence ?? '')
        : null;

    imageEvidence =
        data.imageEvidence != null ? File(data.imageEvidence ?? '') : null;

    update();
  }

  void resetForm() {
    tanggalItem.clear();
    keteranganItem.clear();
    nilaiBrutoItem.clear();
    nilaiPajakItem.clear();
    nilaiNettoItem.clear();
    kategoriItem.clear();
    selectedDate.value = DateTime.now();
  }
}
