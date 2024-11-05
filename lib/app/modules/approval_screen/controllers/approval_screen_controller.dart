import 'package:get/get.dart';

class ApprovalScreenController extends GetxController {
  // Variabel yang mengontrol apakah "Planning" atau "Transaction" yang aktif
  var isPlanning = true.obs;

  // Fungsi untuk memindah Screen ke Planning
  void togglePlanning() {
    isPlanning.value = true;
  }

  // Fungsi untuk memindah Screen ke Transaction
  void toggleTransaction() {
    isPlanning.value = false;
  }
}
