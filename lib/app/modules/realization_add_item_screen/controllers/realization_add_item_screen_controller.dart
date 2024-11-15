import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_screen/controllers/realization_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_screen/views/realization_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/add_planning_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';

class RealizationAddItemScreenController extends GetxController {
  final selectedDate = DateTime.now().obs;

  final id = Get.arguments['id'];
  final TextEditingController tanggalItem = TextEditingController();
  final TextEditingController keteranganItem = TextEditingController();
  final TextEditingController nilaiBrutoItem = TextEditingController();
  final TextEditingController nilaiPajakItem = TextEditingController();
  final TextEditingController nilaiNettoItem = TextEditingController();
  final TextEditingController kategoriItem = TextEditingController();

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
    if (await AddItemServices().addItemPlanning(
        item: AddItem(
            planningId: id,
            date: selectedDate.value,
            information: keteranganItem.text,
            brutoAmount: int.parse(nilaiBrutoItem.text),
            taxAmount: int.parse(nilaiPajakItem.text),
            nettoAmount: int.parse(nilaiNettoItem.text),
            category: kategoriItem.text,
            isAddition: 1))) {
      Get.offAllNamed(Routes.REALIZATION_EDIT_SCREEN, arguments: {
        "id": id,
      });
      final realizationController = RealizationScreenController();
      realizationController.getRealizationData();
    } else {
      print(false);
    }
  }
}
