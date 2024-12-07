import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_expenses_screen/views/add_expenses_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';
import '../controllers/expenses_screen_controller.dart';

class ExpensesScreenView extends GetView<ExpensesScreenController> {
  const ExpensesScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExpensesScreenController());
    final profileController = Get.put(ProfileScreenController());
    return Obx(() {
      return controller.isLoading.value
          ? const Material(
              child: Center(
                  child: CircularProgressIndicator(
                color: HumiColors.humicPrimaryColor,
              )),
            )
          : Scaffold(
              backgroundColor: HumiColors.humicBackgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                FluentIcons.ios_arrow_ltr_24_regular,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                            horizontalSpace(16),
                            Text(
                              "Expenses",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(20),

                        // Filtered History
                        Obx(() {
                          if (controller.userExpensesData.value.data?.data ==
                              null) {
                            return RefreshIndicator(
                              onRefresh: () async =>
                                  controller.getExpensesData(),
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Center(
                                  child: Column(
                                    children: [
                                      verticalSpace(150),
                                      Lottie.asset(
                                        HumicImages.humicDataNotFound,
                                        height: 230,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            // Filter data hanya untuk "expense"
                            var filteredData = controller
                                    .userExpensesData.value.data?.data
                                    ?.where((item) =>
                                        item.transactionType == "expense")
                                    .toList() ??
                                [];

                            return RefreshIndicator(
                              onRefresh: () async =>
                                  controller.getExpensesData(),
                              child: filteredData.isEmpty
                                  ? Center(
                                      child: Column(
                                        children: [
                                          verticalSpace(150),
                                          Lottie.asset(
                                            HumicImages.humicDataNotFound,
                                            height: 230,
                                          ),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: filteredData.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        var data = filteredData[index];
                                        return GestureDetector(
                                          onTap: () => Get.to(() =>
                                              HumicTransactionDetails(
                                                transactionId: '${data.id}',
                                                eventName:
                                                    data.activityName ?? '',
                                                date:
                                                    formatDate(data.createdAt),
                                                type: formatRupiah(
                                                    data.amount ?? 0),
                                                tax: formatRupiah(
                                                    data.taxAmount ?? 0),
                                                transactionTypeName:
                                                    data.transactionType ==
                                                                'income' ||
                                                            data.transactionType ==
                                                                "Income"
                                                        ? "Pemasukan"
                                                        : "Pengeluaran",
                                                status: data.status ?? '',
                                                imageEvidence:
                                                    data.imageEvidence,
                                                documentEvidence:
                                                    data.documentEvidence,
                                              )),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HumiColors
                                                        .humicTransparencyColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 24,
                                                    right: 24,
                                                    top: 21),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Income/Expense Icon
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          verticalSpace(12),
                                                          Image(
                                                            image: AssetImage(
                                                              data
                                                                          .transactionType ==
                                                                      'income'
                                                                  ? HumicImages
                                                                      .humicIncomeSelectedIcon
                                                                  : HumicImages
                                                                      .humicExpensesSelectedIcon,
                                                            ),
                                                            color: data.transactionType ==
                                                                    'income'
                                                                ? HumiColors
                                                                    .humicSecondaryColor
                                                                : HumiColors
                                                                    .humicPrimaryColor,
                                                            width: 32,
                                                          ),
                                                          Text(
                                                            "${data.transactionType}",
                                                            style: GoogleFonts
                                                                .plusJakartaSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: data.transactionType ==
                                                                        'income'
                                                                    ? HumiColors
                                                                        .humicSecondaryColor
                                                                    : HumiColors
                                                                        .humicPrimaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    horizontalSpace(50),

                                                    // Date, Activity Name, Amount
                                                    Container(
                                                      width: 130,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            formatDate(
                                                                data.createdAt),
                                                            maxLines: 2,
                                                            style: GoogleFonts.plusJakartaSans(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: HumiColors
                                                                        .humicPrimaryColor)),
                                                          ),
                                                          Text(
                                                            "${data.activityName}",
                                                            style: GoogleFonts.plusJakartaSans(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: HumiColors
                                                                        .humicBlackColor)),
                                                          ),
                                                          Text(
                                                            formatRupiah(
                                                                data.amount ??
                                                                    0),
                                                            style: GoogleFonts.plusJakartaSans(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: HumiColors
                                                                        .humicTransparencyColor)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    horizontalSpace(30),

                                                    // Transaction Status
                                                    Container(
                                                      width: 71,
                                                      height: 23.67,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.16),
                                                        color: data.status ==
                                                                'approve'
                                                            ? HumiColors
                                                                .humicSecondaryColor
                                                                .withOpacity(
                                                                    0.12)
                                                            : data.status ==
                                                                    'denied'
                                                                ? HumiColors
                                                                    .humicPrimaryColor
                                                                    .withOpacity(
                                                                        0.12)
                                                                : HumiColors
                                                                    .humicThirdSecondaryColor
                                                                    .withOpacity(
                                                                        0.12),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          data.status ?? "",
                                                          style: GoogleFonts
                                                              .plusJakartaSans(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: data.status ==
                                                                      'approve'
                                                                  ? HumiColors
                                                                      .humicSecondaryColor
                                                                  : data.status ==
                                                                          'denied'
                                                                      ? HumiColors
                                                                          .humicPrimaryColor
                                                                      : HumiColors
                                                                          .humicThirdSecondaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              verticalSpace(12),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            );
                          }
                        }),

                        // Pagination Controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Tombol "Previous"
                            IconButton(
                              onPressed: controller.currentPage.value > 1
                                  ? () {
                                      controller.currentPage
                                          .value--; // Kurangi halaman saat ini
                                      controller
                                          .getExpensesData(); // Panggil data untuk halaman baru
                                    }
                                  : null, // Nonaktifkan tombol jika halaman saat ini adalah 1
                              icon: const Icon(
                                FluentIcons.chevron_left_24_regular,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                            Obx(() {
                              int totalPages = ((controller.userExpensesData
                                              .value.data?.total ??
                                          0) +
                                      controller.itemsPerPage -
                                      1) ~/
                                  controller
                                      .itemsPerPage; // Hitung total halaman (dibulatkan ke atas)
                              return Row(
                                children: List.generate(totalPages, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0), // Menambahkan jarak
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.currentPage.value = index +
                                            1; // Ubah ke halaman yang dipilih
                                        controller
                                            .getExpensesData(); // Panggil data untuk halaman baru
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            controller.currentPage.value ==
                                                    (index + 1)
                                                ? HumiColors.humicPrimaryColor
                                                : Colors.grey,
                                        child: Text(
                                          '${index + 1}',
                                          style: const TextStyle(
                                            color: HumiColors.humicWhiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }),
                            // Tombol "Next"
                            IconButton(
                              onPressed: (controller.currentPage.value *
                                          controller.itemsPerPage) <
                                      (controller.userExpensesData.value.data
                                              ?.total ??
                                          0)
                                  ? () {
                                      controller.currentPage.value++;
                                      controller.getExpensesData();
                                    }
                                  : null,
                              icon: const Icon(
                                FluentIcons.chevron_right_24_regular,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(12),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: GetBuilder<ExpensesScreenController>(
                builder: (controller) {
                  bool isAdmin =
                      profileController.userProfileData?.role == 'admin';

                  if (!isAdmin) {
                    return const SizedBox();
                  }

                  return SizedBox(
                    width: 145,
                    height: 51,
                    child: FloatingActionButton(
                      onPressed: () =>
                          Get.to(() => const AddExpensesScreenView()),
                      backgroundColor: HumiColors.humicPrimaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            const Icon(
                              FluentIcons.add_24_regular,
                              color: HumiColors.humicWhiteColor,
                              size: 20,
                            ),
                            horizontalSpace(6),
                            Text(
                              "Add Expense",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicWhiteColor)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
