import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning_compare.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

class CompareDetailsScreenController extends GetxController {
  var id = Get.arguments['id'];
  bool isLoading = true;
  
  PlanningCompare? compare = PlanningCompare();
  // Variabel yang mengontrol apakah "Planning" atau "Realization" yang aktif
  var isPlanning = true.obs;

  // Fungsi untuk memindah Screen ke Planning
  void togglePlanning() {
    isPlanning.value = true;
  }

  // Fungsi untuk memindah Screen ke Realization
  void toggleRealization() {
    isPlanning.value = false;
  }
  void compareDetails() async{
    compare = await ApprovalServices().getCompareDetail(id: id);
    isLoading = false;
    update();
    
  }
  @override
  void onInit() {
    super.onInit();
    compareDetails();
  }
}
