import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';

class PlanningAddScreenController extends GetxController {
  var planningData = <GetPlanning>[].obs;
  var isLoading = true.obs;

  final TextEditingController namePlan = TextEditingController();
  final TextEditingController deadlinePlan = TextEditingController();
  final TextEditingController targetPlan = TextEditingController();
  final TextEditingController descriptionPlan = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    //fetchPlanningData();
  }
}
