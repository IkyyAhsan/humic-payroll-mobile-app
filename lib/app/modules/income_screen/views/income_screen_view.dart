import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_income_screen/views/add_income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';
import '../controllers/income_screen_controller.dart';

class IncomeScreenView extends GetView<IncomeScreenController> {
  const IncomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IncomeScreenController());
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
                  child: ListView(
                    children: [
                      verticalSpace(24),
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                FluentIcons.ios_arrow_ltr_24_regular,
                                color: HumiColors.humicBlackColor,
                              )),
                          horizontalSpace(16),
                          Text(
                            "Income",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor)),
                          ),
                        ],
                      ),
                      verticalSpace(20),

                      // Transaction List
                      Obx(() {
                        if (controller.incomeTransactions.isEmpty) {
                          return Center(
                            child: Column(
                              children: [
                                verticalSpace(150),
                                Lottie.asset(
                                  HumicImages.humicDataNotFound,
                                  height: 230,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: controller.incomeTransactions.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = controller.incomeTransactions[index];
                              return GestureDetector(
                                onTap: () =>
                                    Get.to(() => HumicTransactionDetails(
                                          transactionId: '${data.id}',
                                          eventName: data.activityName,
                                          date: formatDate(data.createdAt),
                                          type: formatRupiah(data.amount),
                                          tax: formatRupiah(data.taxAmount),
                                          transactionTypeName:
                                              data.transactionType ==
                                                          'income' ||
                                                      data.transactionType ==
                                                          "Income"
                                                  ? "Pemasukan"
                                                  : "Pengeluaran",
                                          status: data.status,
                                          documentEvidence:
                                              data.documentEvidence ?? 'empty',
                                        )),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              HumiColors.humicTransparencyColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Income/Expense Icon
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                verticalSpace(12),
                                                Image(
                                                  image: AssetImage(
                                                    data.transactionType ==
                                                                'income' ||
                                                            data.transactionType ==
                                                                'Income'
                                                        ? HumicImages
                                                            .humicIncomeSelectedIcon
                                                        : HumicImages
                                                            .humicExpensesSelectedIcon,
                                                  ),
                                                  color: data.transactionType ==
                                                              'income' ||
                                                          data.transactionType ==
                                                              'Income'
                                                      ? HumiColors
                                                          .humicSecondaryColor
                                                      : HumiColors
                                                          .humicPrimaryColor,
                                                  width: 32,
                                                ),
                                                Text(
                                                  data.transactionType,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: data.transactionType ==
                                                                  'income' ||
                                                              data.transactionType ==
                                                                  'Income'
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
                                          horizontalSpace(30),

                                          // Date, Activity Name, Amount
                                          SizedBox(
                                            width: 150,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  formatDate(data.createdAt),
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: HumiColors
                                                          .humicPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  data.activityName,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: HumiColors
                                                          .humicBlackColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  formatRupiah(data.amount),
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: HumiColors
                                                          .humicTransparencyColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          horizontalSpace(20),

                                          // Transaction Status
                                          Container(
                                            width: 71,
                                            height: 23.67,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.16),
                                              color: data.status == 'approve'
                                                  ? HumiColors
                                                      .humicSecondaryColor
                                                      .withOpacity(0.12)
                                                  : data.status == 'pending'
                                                      ? HumiColors
                                                          .humicThirdSecondaryColor
                                                          .withOpacity(0.12)
                                                      : HumiColors
                                                          .humicPrimaryColor
                                                          .withOpacity(0.12),
                                            ),
                                            child: Center(
                                              child: Text(
                                                data.status,
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    color: data.status ==
                                                            'approve'
                                                        ? HumiColors
                                                            .humicSecondaryColor
                                                        : data.status ==
                                                                'pending'
                                                            ? HumiColors
                                                                .humicThirdSecondaryColor
                                                            : HumiColors
                                                                .humicPrimaryColor,
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
                                        .getUserIncomeData(); // Panggil data untuk halaman baru
                                  }
                                : null, // Nonaktifkan tombol jika halaman saat ini adalah 1
                            icon: const Icon(
                              FluentIcons.chevron_left_24_regular,
                              color: HumiColors.humicBlackColor,
                            ),
                          ),
                          Obx(() {
                            int totalPages = ((controller
                                            .userIncomeData.value.data?.total ??
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
                                          .getUserIncomeData(); // Panggil data untuk halaman baru
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
                                    (controller
                                            .userIncomeData.value.data?.total ??
                                        0)
                                ? () {
                                    controller.currentPage.value++;
                                    controller.getUserIncomeData();
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
              floatingActionButton: GetBuilder<IncomeScreenController>(
                builder: (controller) {
                  bool isAdmin =
                      profileController.userProfileData?.role == 'admin';

                  if (!isAdmin) {
                    return const SizedBox();
                  }

                  return SizedBox(
                    width: 138,
                    height: 51,
                    child: FloatingActionButton(
                      onPressed: () =>
                          Get.to(() => const AddIncomeScreenView()),
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
                              "Add Income",
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
