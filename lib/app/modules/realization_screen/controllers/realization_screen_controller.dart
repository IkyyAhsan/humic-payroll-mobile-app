import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/data/models/realization.dart';
import 'package:humic_payroll_mobile_app/app/services/realization_services.dart';

class RealizationScreenController extends GetxController {
  var realizationData =
      Realization().obs; // Menggunakan Rx untuk data realisasi
  var isLoading = true.obs; // Menggunakan RxBool untuk status loading
  var isEditMode = false.obs;
  UserProfile? userProfileData;

  var selectedRealizationYear = DateTime.now().year.obs;

  // Fungsi untuk memuat data berdasarkan tahun
  void fetchDataForYear(int year) async {
    isLoading.value = true;

    // Panggil layanan untuk mengambil data berdasarkan tahun
    final realizationResponse =
        await RealizationServices().getRealizationData(year: year);

    if (realizationResponse != null) {
      realizationData.value =
          realizationResponse; // Memperbarui data dengan respons
    } else {
      print('No data received from API');
    }

    isLoading.value = false; // Set loading ke false setelah data diambil
  }

  // Fungsi untuk memperbarui data berdasarkan tahun
  void updateRealizationYear(int year) {
    selectedRealizationYear.value = year; // Update tahun yang dipilih
    fetchDataForYear(year); // Ambil data berdasarkan tahun yang dipilih
  }

  // Fungsi untuk mengambil data realisasi
  void getRealizationData() async {
    isLoading.value = true;

    final realizationResponse =
        await RealizationServices().getRealizationData();
    print(realizationResponse?.data);

    if (realizationResponse != null) {
      realizationData.value = realizationResponse;
      print(realizationData.value.data);
    } else {
      print('No data received from API');
    }

    isLoading.value =
        false; // Set loading ke false setelah data selesai diambil
  }

  @override
  void onInit() {
    getRealizationData(); // Ambil data saat controller diinisialisasi
    isEditMode.value = false;
    super.onInit();
  }

  // Fungsi untuk toggle mode edit
  void toggleEditMode() {
    isEditMode.value = !isEditMode.value; // Ubah status mode edit
  }

  var pageData = <Datum>[].obs; // Data halaman yang digunakan
}
