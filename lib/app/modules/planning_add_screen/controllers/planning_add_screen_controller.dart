import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';

class PlanningAddScreenController extends GetxController {
  var planningData = <GetPlanning>[].obs;
  var isLoading = true.obs;
  var i = 5;

  final TextEditingController namePlan = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    //fetchPlanningData();
  }
}
