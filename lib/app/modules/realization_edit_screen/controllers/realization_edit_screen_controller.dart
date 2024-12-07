import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_realization.dart';
import 'package:humic_payroll_mobile_app/app/services/show_realization_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import '../../../services/realization_services.dart';

class RealizationEditScreenController extends GetxController {
  ShowRealization? realizationDetailData;
  bool isLoading = true;
  bool isRealization = false;
  var id = Get.arguments['id'];

  // Edit Item
  final TextEditingController tanggalItem = TextEditingController();
  final TextEditingController keteranganItem = TextEditingController();
  final TextEditingController nilaiBrutoItem = TextEditingController();
  final TextEditingController nilaiPajakItem = TextEditingController();
  final TextEditingController nilaiNettoItem = TextEditingController();
  final TextEditingController kategoriItem = TextEditingController();
  File? documentEvidence;
  File? imageEvidence;

  @override
  void onInit() {
    super.onInit();
    getRealizationDetailData();
  }

  void getRealizationDetailData() async {
    isLoading = true;
    realizationDetailData =
        await ShowRealizationServices().getShowRealization(id);
    isLoading = false;
    update();
  }

  void delete(int itemId) async {
    isRealization = await RealizationServices().deleteItem(itemId);
    Get.snackbar(
      'Success',
      'Item has been successfully deleted',
      backgroundColor: HumiColors.humicSecondaryColor,
      colorText: HumiColors.humicWhiteColor,
    );
    if (isRealization) {
      getRealizationDetailData();
      update();
    } else {
      Get.snackbar('Failure', 'Failed to delete item',
          backgroundColor: HumiColors.humicPrimaryColor,
          colorText: HumiColors.humicWhiteColor);
    }
  }

  void resetData() {
    realizationDetailData = null;
    update();
  }
}
