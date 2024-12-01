import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_planning.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_planning.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_next_screen.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/controllers/planning_detail_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/services/add_planning_services.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:intl/intl.dart';

class PlanningEditItemScreenController extends GetxController {
  var items = <Map<String, String>>[].obs;
  var planningData = <AddItem>[].obs;
  var rows = <TableRow>[].obs;
  var isLoading = true.obs;
  bool isPlanningItem = false;
  var i = 5;
  final selectedDate = DateTime.now().obs;
  final selectedDate2 = DateTime.now().obs;
  final selectedDate3 = DateTime.now().obs;

  final isSuccessAddPlanning = false.obs;
  final data = Rxn<PlanningDetail>();
  ShowPlanning? planningDetailData;

  // Add Planning
  final TextEditingController namePlan = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  // Add Item
  final TextEditingController tanggalItem = TextEditingController();
  final TextEditingController keteranganItem = TextEditingController();
  final TextEditingController nilaiBrutoItem = TextEditingController();
  final TextEditingController nilaiPajakItem = TextEditingController();
  final TextEditingController nilaiNettoItem = TextEditingController();
  final TextEditingController kategoriItem = TextEditingController();
  File? documentEvidence;
  File? imageEvidence;

  @override
  Future<void> dispose() async {
    await Future.delayed(const Duration(seconds: 3));

    // Membersihkan controller
    tanggalItem.clear();
    keteranganItem.clear();
    nilaiBrutoItem.clear();
    nilaiPajakItem.clear();
    nilaiNettoItem.clear();
    kategoriItem.clear();
    documentEvidence = null;
    imageEvidence = null;

    super.dispose();
  }

  void removeItem(int index) {
    rows.removeAt(index);
  }

  void changeStartDate() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(
        2101,
      ),
    );
    if (date != null) {
      startDate.text = formatDate(date);
    }
    selectedDate.value = date ?? DateTime.now();
  }

  void changeEndDate() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(
        2101,
      ),
    );
    if (date != null) {
      endDate.text = formatDate(date);
    }
    selectedDate2.value = date ?? DateTime.now();
  }

  void changeDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate3.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

      endDate.text = formattedDate;

      selectedDate3.value = selectedDate;
    }
  }

  void checkPlanningAddItem() async {
    data.value = await PlanningServices().postPlanning(
        planning: AddPlanning(
            title: namePlan.text,
            startDate: selectedDate.value,
            endDate: selectedDate2.value));
    print(data);
    // ignore: unnecessary_null_comparison
    isSuccessAddPlanning.value = data != null;
    if (isSuccessAddPlanning.value) {
      Get.to(
          () => PlanningAddNextScreen(
                id: data.value?.id,
              ),
          arguments: {
            "name": namePlan.text,
            "startDate": startDate,
            "endDate": endDate,
          });
    }
  }

  void addItem({int? id}) async {
    bool result = await AddItemServices().addItemPlanning(
      item: AddItem(
          planningId: id ?? data.value?.id ?? 0,
          date: selectedDate3.value,
          information: keteranganItem.text,
          brutoAmount: int.parse(nilaiBrutoItem.text),
          taxAmount: int.parse(nilaiPajakItem.text),
          nettoAmount: int.parse(nilaiNettoItem.text),
          category: kategoriItem.text,
          isAddition: 0,
          documentEvidence: documentEvidence,
          imageEvidence: imageEvidence),
    );
    print("AddItem Result: $result"); // Debugging
    if (result) {
      final controller = Get.put(PlanningDetailScreenController());
      controller.getPlanningDetailData(planningId: data.value?.id);
      print(controller.planningDetailData);
      print("id: ${data.value?.id}");
      Get.to(const PlanningAddNextScreen(), arguments: {"id": data.value?.id});
      controller.update();

      update();
    } else {
      print("AddItem failed");
    }
  }
}