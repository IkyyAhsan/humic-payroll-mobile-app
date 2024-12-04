import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_planning.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_next_screen.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/controllers/planning_detail_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/services/add_planning_services.dart';
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

  // Edit Planning

  final TextEditingController endDate = TextEditingController();

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

  @override
  void onInit() {
    super.onInit();
    loadEdit();
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

  void addItem({int? id}) async {
    bool result = await AddItemServices().addItemPlanning(
      item: AddItem(
        planningId: data.value?.id ?? 0,
        date: selectedDate3.value,
        information: keteranganItem.text,
        brutoAmount: int.tryParse(nilaiBrutoItem.text) ?? 0,
        taxAmount: int.parse(nilaiPajakItem.text),
        nettoAmount: int.parse(nilaiNettoItem.text),
        category: kategoriItem.text,
        documentEvidence: documentEvidence == null ? null : documentEvidence,
        imageEvidence: imageEvidence == null ? null : imageEvidence,
        isAddition: 0,
      ),
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

  void editItemPlanning({int? id}) async {
    bool result = await AddItemServices().editItemPlanning(
      id: Get.arguments['data'].id,
      item: AddItem(
        planningId: Get.arguments['id'],
        date: selectedDate3.value,
        information: keteranganItem.text,
        brutoAmount: int.tryParse(nilaiBrutoItem.text) ?? 0,
        taxAmount: int.tryParse(nilaiPajakItem.text) ?? 0,
        nettoAmount: int.tryParse(nilaiNettoItem.text) ?? 0,
        category: kategoriItem.text,
        documentEvidence: null,
        imageEvidence: null,
        isAddition: 0,
      ),
    );
    print("Edit Item Result: $result");
    if (result) {
      Item item = Get.arguments['data'];
      final controller = Get.put(PlanningDetailScreenController());
      controller.getPlanningDetailData(planningId: item.planningId);

      Get.to(const PlanningAddNextScreen(),
          arguments: {"id": item.planningId ?? 0});
      // controller.update();
      dispose();

      update();
    } else {
      print("AddItem failed");
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
  }

  void saveChangesEditPlanningItem() async {}
}
