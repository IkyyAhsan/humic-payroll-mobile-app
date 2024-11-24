import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/realization.dart';
import 'package:humic_payroll_mobile_app/app/services/realization_services.dart';

class RealizationScreenController extends GetxController {
  var realizationData = Realization();
  var isLoading = true;
  var isEditMode = false.obs;

  var selectedRealizationYear = DateTime.now().year.obs;

  // Fungsi memuat data berdasarkan tahun
  void fetchDataForYear(int year) {
    // Implementasi untuk memuat data dashboard berdasarkan tahun
    // Contoh:
    // dashboardData.value = await DashboardServices().getDashboardData(year: year);
  }

  // Fungsi untuk memperbarui data berdasarkan tahun
  void updateRealizationYear(int year) {
    selectedRealizationYear.value = year;
    fetchDataForYear(year);
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

  @override
  void onInit() {
    getRealizationData();
    isEditMode.value = false;
    super.onInit();
  }

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;

    if (!isEditMode.value) {
      isEditMode.value = false;
    }
  }

  var pageData = <Datum>[].obs;
}
