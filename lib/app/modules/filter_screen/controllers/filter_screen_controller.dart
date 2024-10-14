import 'package:get/get.dart';

class FilterScreenController extends GetxController {
  // Mengelola state untuk pilihan tipe
  var selectedType = "All".obs;

  // Mengelola state untuk tanggal awal dan akhir
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  // Fungsi untuk memperbarui pilihan tipe
  void updateType(String type) {
    selectedType.value = type;
  }

  // Fungsi untuk memperbarui rentang tanggal
  void updateDateRange(DateTime start, DateTime end) {
    startDate.value = start;
    endDate.value = end;
  }

  // Fungsi untuk reset filter
  void resetFilters() {
    selectedType.value = "All";
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
  }
}
