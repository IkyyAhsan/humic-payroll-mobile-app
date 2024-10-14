import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/add_expenses_screen_controller.dart';

class AddExpensesScreenView extends GetView<AddExpensesScreenController> {
  const AddExpensesScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> addExpensesFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: addExpensesFormKey,
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
                        "Add Expenses",
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: HumiColors.humicBlackColor)),
                      )
                    ],
                  ),
                  verticalSpace(32),
                  const Divider(
                    color: HumiColors.humicDividerColor,
                    height: 2,
                  ),
                  verticalSpace(24),
                  Text(
                    "Nama Kegiatan",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Nama Kegiatan
                  TextFormField(
                    //controller: loginController.emailController,
                    decoration: InputDecoration(
                        hintText: "Masukkan nama kegiatan..",
                        hintStyle: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HumiColors.humicTransparencyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: HumiColors.humicBlackColor))),
                  ),
                  verticalSpace(14),

                  Text(
                    "Tanggal",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Tanggal
                  TextFormField(
                    //controller: loginController.emailController,
                    decoration: InputDecoration(
                        hintText: "DD/MM/YYYY",
                        hintStyle: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HumiColors.humicTransparencyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: HumiColors.humicBlackColor))),
                  ),
                  verticalSpace(14),

                  Text(
                    "Pengeluaran",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Pemasukan
                  TextFormField(
                    //controller: loginController.emailController,
                    decoration: InputDecoration(
                        hintText: "Masukkan jumlah pengeluaran..",
                        hintStyle: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HumiColors.humicTransparencyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: HumiColors.humicBlackColor))),
                  ),
                  verticalSpace(14),

                  Text(
                    "Pemasukan",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Pajak
                  TextFormField(
                    //controller: loginController.emailController,
                    decoration: InputDecoration(
                        hintText: "Masukkan jumlah pajak..",
                        hintStyle: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HumiColors.humicTransparencyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: HumiColors.humicBlackColor))),
                  ),
                  verticalSpace(14),

                  Text(
                    "Upload",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Upload
                  Container(
                    height: 150, // Tinggi sesuai yang diinginkan
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: HumiColors.humicBlackColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      //controller: loginController.emailController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 60),
                          hintText: "Upload File Keuangan (PDF/xlsx)",
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicTransparencyColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HumiColors.humicBlackColor))),
                    ),
                  ),
                  verticalSpace(14),

                  // Evidence
                  Text(
                    "Evidence",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicBlackColor)),
                  ),
                  verticalSpace(12),

                  // Upload
                  Container(
                    height: 150, // Tinggi sesuai yang diinginkan
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: HumiColors.humicBlackColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      //controller: loginController.emailController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 60),
                          hintText: "Upload File Bukti (PNG/JPG/PDF)",
                          hintStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicTransparencyColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HumiColors.humicBlackColor))),
                    ),
                  ),
                  verticalSpace(50),
                  // Cancel and Apply Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 128,
                        height: 43,
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
                      horizontalSpace(10),
                      SizedBox(
                        width: 128,
                        height: 43,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HumiColors.humicPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicWhiteColor),
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
      ),
    );
  }
}
