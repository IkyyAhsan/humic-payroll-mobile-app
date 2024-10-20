import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/add_income_screen_controller.dart';

class AddIncomeScreenView extends GetView<AddIncomeScreenController> {
  const AddIncomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> addIncomeFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: addIncomeFormKey,
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
                        "Add Income",
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
                    "Pemasukan",
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
                        hintText: "Masukkan jumlah pemasukan..",
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: HumiColors.humicBlackColor, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(HumicImages.humicUploadImageIcon),
                          ),
                          Text("Upload File Keuangan (PDF/xlsx)")
                        ],
                      ),
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

                  // Evidence
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: HumiColors.humicBlackColor, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(HumicImages.humicUploadImageIcon),
                          ),
                          Text("Upload File Evidence (PDF/PNG/JPG)")
                        ],
                      ),
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
