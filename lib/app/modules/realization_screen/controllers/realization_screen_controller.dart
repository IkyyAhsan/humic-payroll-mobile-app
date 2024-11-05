import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning_input.dart';
import 'package:humic_payroll_mobile_app/app/services/realization_services.dart';

class RealizationScreenController extends GetxController {
  var realizationData = <Datum>[].obs;
  var isLoading = true.obs;

  void getRealizationData() async {
    isLoading.value = true;
    final realizationResponse =
        await RealizationServices().getRealizationData();

    if (realizationResponse != null) {
      realizationData.value =
          realizationResponse.data.data; // Menyimpan data ke planningData
      print('Jumlah Data Planning: ${realizationData.length}');

      // Log detail setiap item `Datum`
      for (var datum in realizationData) {
        print(
            'ID: ${datum.id}, Title: ${datum.title}, Status: ${datum.status}, Start Date: ${datum.startDate}');
      }
    } else {
      print('No data received from API');
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    getRealizationData();
    super.onInit();
  }
}
