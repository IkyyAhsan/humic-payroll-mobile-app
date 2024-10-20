import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/services/dashboard_services.dart';

class HomeScreenController extends GetxController {
  var dashboardData = Dashboard().obs;
  var filteredTransactions = <Datum>[].obs;
  var isLoading = true.obs;

  var selectedType = "All".obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();

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
}
