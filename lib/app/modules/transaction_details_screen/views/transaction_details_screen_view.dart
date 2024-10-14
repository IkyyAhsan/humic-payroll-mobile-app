import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/transaction_details_screen_controller.dart';

class TransactionDetailsScreenView
    extends GetView<TransactionDetailsScreenController> {
  const TransactionDetailsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
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
                        )),
                    horizontalSpace(16),
                    Text(
                      "Transaction Details",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    )
                  ],
                ),
                verticalSpace(20),
                const Divider(
                  color: HumiColors.humicDividerColor,
                  height: 2,
                ),
                verticalSpace(43),

                // Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No. Kegiatan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      "01",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor)),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kegiatan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      "Conference 1",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor)),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tanggal",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      "03 Okt 2024",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor)),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pemasukan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      "Rp600.000.000",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor)),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pajak",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      "Rp600.000.000",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor)),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 6
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upload",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FluentIcons.document_table_24_regular,
                          weight: 4,
                        ),
                        horizontalSpace(8),
                        Text(
                          "Laporan.xlsx",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor)),
                        )
                      ],
                    )
                  ],
                ),
                verticalSpace(42),

                // Row 7
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Evidence",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FluentIcons.document_pdf_24_regular,
                          weight: 4,
                        ),
                        horizontalSpace(8),
                        Text(
                          "Bukti.pdf",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor)),
                        )
                      ],
                    )
                  ],
                ),
                verticalSpace(42),
                Center(
                  child: SizedBox(
                    width: 173,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HumiColors.humicCancelColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(
                              color: HumiColors.humicCancelTextColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
