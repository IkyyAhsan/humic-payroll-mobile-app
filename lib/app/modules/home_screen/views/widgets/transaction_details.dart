import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/short_file_name.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:open_filex/open_filex.dart';

class HumicTransactionDetails extends StatelessWidget {
  const HumicTransactionDetails({
    super.key,
    required this.transactionId,
    required this.eventName,
    required this.date,
    required this.type,
    required this.tax,
    required this.transactionTypeName,
    required this.status,
    this.uploadFile,
    this.evidence,
  });

  final String transactionTypeName;
  final String transactionId;
  final String eventName;
  final String date;
  final String type;
  final String tax;
  final String status;
  final String? uploadFile;
  final String? evidence;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
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
                      "No Kegiatan",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      transactionId,
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
                      eventName,
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
                      date,
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
                      transactionTypeName,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor)),
                    ),
                    Text(
                      type,
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
                      tax,
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
                      "Document Evidence",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (uploadFile != null) {
                          final result = await OpenFilex.open(uploadFile!);
                          if (result.type != ResultType.done) {
                            // Tampilkan pesan jika tidak bisa membuka file
                            Get.snackbar("Error",
                                "Unable to open the file. Please ensure a viewer application is installed.",
                                backgroundColor: HumiColors.humicPrimaryColor,
                                colorText: HumiColors.humicWhiteColor);
                            print("File path: $uploadFile");
                          }
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.document_table_24_regular,
                            weight: 4,
                          ),
                          horizontalSpace(8),
                          Row(
                            children: [
                              Text(
                                uploadFile != null
                                    ? shortenFileName(uploadFile!)
                                    : 'No File Attached',
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicBlackColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(42),

                // Row 7
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Image Evidence",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (evidence != null) {
                          final result = await OpenFilex.open(evidence!);
                          if (result.type != ResultType.done) {
                            Get.snackbar("Error",
                                "Unable to open the file. Please ensure a viewer application is installed.",
                                backgroundColor: HumiColors.humicPrimaryColor,
                                colorText: HumiColors.humicWhiteColor);
                            print("File path: $evidence");
                          }
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.document_table_24_regular,
                            weight: 4,
                          ),
                          horizontalSpace(8),
                          Row(
                            children: [
                              Text(
                                evidence != null
                                    ? shortenFileName(evidence!)
                                    : 'No File Attached',
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicBlackColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(80),

                // Button For Delete
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (controller.userProfileData?.role == 'admin' &&
                        (status == 'decline' || status == 'pending'))
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.deleteTransaction(
                              id: int.parse(transactionId),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(),
                            backgroundColor: HumiColors.humicPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Icon(
                            FluentIcons.delete_24_regular,
                            size: 20,
                            color: HumiColors.humicWhiteColor,
                          ),
                        ),
                      ),

                    // Kondisi: Jika bukan admin, maka dapat menghapus untuk semua status
                    if (controller.userProfileData?.role != 'admin')
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.deleteTransaction(
                              id: int.parse(transactionId),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(),
                            backgroundColor: HumiColors.humicPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Icon(
                            FluentIcons.delete_24_regular,
                            size: 20,
                            color: HumiColors.humicWhiteColor,
                          ),
                        ),
                      ),
                    horizontalSpace(16),

                    // Tombol Close selalu ditampilkan
                    SizedBox(
                      width: 173,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HumiColors.humicPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HumiColors.humicWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
