import 'package:get/get.dart';

class FilterScreenController extends GetxController {
  var selectedType = "All".obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  void updateType(String type) {
    selectedType.value = type;
  }

  void updateDateRange(DateTime start, DateTime end) {
    startDate.value = start;
    endDate.value = end;
  }

  void resetFilters() {
    selectedType.value = "All";
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
  }
}
