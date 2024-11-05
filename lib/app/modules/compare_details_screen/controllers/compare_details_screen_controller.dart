import 'package:get/get.dart';

class CompareDetailsScreenController extends GetxController {
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
}
