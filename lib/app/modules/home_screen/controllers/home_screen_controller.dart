import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/services/dashboard_services.dart';
import 'package:humic_payroll_mobile_app/app/services/finance_services.dart';
import 'package:humic_payroll_mobile_app/app/services/profile_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class HomeScreenController extends GetxController {
  var dashboardData = Dashboard().obs;
  var barChartData = Dashboard().obs;
  var pieChartData = Dashboard().obs;
  var filteredTransactions = <Transaction>[].obs;
  var isLoading = true.obs;

  var selectedType = "All".obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  UserProfile? userProfileData;

  var selectedBarChartYear = DateTime.now().year.obs;
  var selectedPieChartYear = DateTime.now().year.obs;

  void deleteTransaction({int? id}) async {
    print(id);
    isLoading.value = true;
    final data = await FinanceServices().deleteFinance(id: id);
    if (data) {
      Get.back();
      update();
      getDashboardData();
      isLoading.value = false;
      Get.to(BottomNavigationBarView());
      final navbarcontroller = Get.put(BottomNavigationBarController());
      navbarcontroller.selectedIndex(3);
      Get.snackbar(
        "Success",
        "Transaction has been deleted successfully.",
        backgroundColor: HumiColors.humicSecondaryColor,
        colorText: HumiColors.humicWhiteColor,
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
    }
  }

  // Fungsi untuk memperbarui tahun
  void updateBarChartYear(int year) {
    selectedBarChartYear.value = year;
    fetchDataBarChartForYear(year);
  }

  // Fungsi untuk memperbarui tahun
  void updatePieChartYear(int year) {
    selectedPieChartYear.value = year;
    fetchDataPieChartForYear(year);
  }

  // Fungsi memuat data berdasarkan tahun
  void fetchDataBarChartForYear(int year) async {
    // Konversi tahun ke ISO format
    DateTime isoDate = convertYearToIsoString(year);

    // Panggil service backend dengan parameter ISO string
    var response = await DashboardServices().getDashboardData(year: isoDate);

    // Update data jika diperlukan
    if (response != null) {
      barChartData.value = response;
    }
  }

  void fetchDataPieChartForYear(int year) async {
    // Konversi tahun ke ISO format
    DateTime isoDate = convertYearToIsoString(year);

    // Panggil service backend dengan parameter ISO string
    var response = await DashboardServices().getDashboardData(year: isoDate);

    // Update data jika diperlukan
    if (response != null) {
      pieChartData.value = response;
    }
  }

  // Mendapatkan data dashboard
  void getDashboardData() async {
    isLoading.value = true;
    dashboardData.value = (await DashboardServices().getDashboardData())!;

    applyFilter();
  }

  // Fungsi untuk filter transaksi
  void applyFilter() {
    List<Transaction>? transactions =
        dashboardData.value.data?.transactionList?.data;

    // Filter berdasarkan tipe transaksi
    if (selectedType.value != "All") {
      transactions = transactions
          ?.where((transaction) =>
              transaction.transactionType?.toLowerCase() ==
              selectedType.value.toLowerCase())
          .toList();
    }

    // Filter berdasarkan rentang tanggal
    if (startDate.value != null && endDate.value != null) {
      transactions = transactions
          ?.where((transaction) =>
              transaction.createdAt != null &&
              transaction.createdAt!.isAfter(startDate.value!) &&
              transaction.createdAt!
                  .isBefore(endDate.value!.add(const Duration(days: 1))))
          .toList();
    }

    filteredTransactions.value = transactions ?? [];
  }

  @override
  void onInit() {
    getDashboardData();
    getUserProfileData();
    isLoading.value = false;

    super.onInit();
  }

  // Memperbarui filter tipe transaksi
  void updateTransactionTypeFilter(String type) {
    selectedType.value = type;
    applyFilter();
  }

  // Memperbarui rentang tanggal filter
  void updateDateRangeFilter(DateTime start, DateTime end) {
    startDate.value = start;
    endDate.value = end;
    applyFilter();
  }

  void getUserProfileData() async {
    userProfileData = await UserProfileServices().getUserProfile();
    print(userProfileData);
    update();
  }

  // Variabel yang mengontrol apakah "Realization" atau "Transaction" Planning yang aktif
  var isPlanningRealization = true.obs;

  // Variabel yang mengontrol apakah "Realization" atau "Transaction" Approve yang aktif
  var isApproveRealization = true.obs;

  // Fungsi untuk memindah Screen ke Realization
  void planningToggleRealization() {
    isPlanningRealization.value = true;
    print(isPlanningRealization.value);
  }

  // Fungsi untuk memindah Screen ke Transaction
  void planningToggleTransaction() {
    isPlanningRealization.value = false;
    print(isPlanningRealization.value);
  }

  // Fungsi untuk memindah Screen ke Realization
  void approveToggleRealization() {
    isApproveRealization.value = true;
  }

  // Fungsi untuk memindah Screen ke Transaction
  void approveToggleTransaction() {
    isApproveRealization.value = false;
  }

  // Fungsi untuk memformat nama bulan menjadi singkatan tiga huruf
  String formatMonth(String? monthName) {
    if (monthName == null || monthName.isEmpty) return '';
    switch (monthName.toLowerCase()) {
      case 'january':
        return 'Jan';
      case 'february':
        return 'Feb';
      case 'march':
        return 'Mar';
      case 'april':
        return 'Apr';
      case 'may':
        return 'May';
      case 'june':
        return 'Jun';
      case 'july':
        return 'Jul';
      case 'august':
        return 'Aug';
      case 'september':
        return 'Sep';
      case 'october':
        return 'Oct';
      case 'november':
        return 'Nov';
      case 'december':
        return 'Dec';
      default:
        return monthName;
    }
  }
}

DateTime convertYearToIsoString(int year) {
  return DateTime(year, 1, 1); // Tahun ke 1 Januari pada tahun tersebut
}
