import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/services/dashboard_services.dart';
import 'package:humic_payroll_mobile_app/app/services/profile_services.dart';

class HomeScreenController extends GetxController {
  var dashboardData = Dashboard().obs;
  var filteredTransactions = <Datum>[].obs;
  var isLoading = true.obs;

  var selectedType = "All".obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  UserProfile? userProfileData;

  // Mendapatkan data dashboard
  void getDashboardData() async {
    isLoading.value = true;
    dashboardData.value = (await DashboardServices().getDashboardData())!;

    applyFilter();

    isLoading.value = false;
  }

  // Fungsi untuk filter transaksi
  void applyFilter() {
    List<Datum>? transactions = dashboardData.value.data?.transactionList?.data;

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
  }

  // Fungsi untuk memindah Screen ke Transaction
  void planningToggleTransaction() {
    isPlanningRealization.value = false;
  }

  // Fungsi untuk memindah Screen ke Realization
  void approveToggleRealization() {
    isApproveRealization.value = true;
  }

  // Fungsi untuk memindah Screen ke Transaction
  void approveToggleTransaction() {
    isApproveRealization.value = false;
  }
}
