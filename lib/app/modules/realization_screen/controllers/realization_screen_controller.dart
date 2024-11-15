import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/realization.dart';
import 'package:humic_payroll_mobile_app/app/services/realization_services.dart';

class RealizationScreenController extends GetxController {
  var realizationData = Realization();
  var isLoading = true;
  var isEditMode = false.obs;

  @override
  void onInit() {
    getRealizationData();
    isEditMode.value = false;
    super.onInit();
  }

  void getRealizationData() async {
    isLoading = true;
    final realizationResponse =
        await RealizationServices().getRealizationData();
    print(realizationResponse);

    if (realizationResponse != null) {
      realizationData = realizationResponse;
    } else {
      print('No data received from API');
    }
    isLoading = false;
    update();
  }

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;

    if (!isEditMode.value) {
      isEditMode.value = false;
    }
  }
}
