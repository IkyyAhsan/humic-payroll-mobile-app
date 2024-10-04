import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/expenses_screen/views/expenses_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/income_screen/views/income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => (){},
      //   backgroundColor: HumiColors.humicPrimaryColor,
      //   child: const Icon(FluentIcons.print_24_regular, color: HumiColors.humicWhiteColor,),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                Text(
                  "Dashboard", 
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor
                    ),
                  ),
                ),
                verticalSpace(18),

                // Container Balance 
                CarouselSlider(
                  options: CarouselOptions(
                    height: 120,
                    enlargeCenterPage: true,
                    viewportFraction: 0.5,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5)
                  ),
                  items: [
                    Container(
                        width: 172,
                        height: 117,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: HumiColors.humicPrimaryColor,
                          border: Border.all(
                            color: HumiColors.humicPrimaryColor,
                          )
                        ),
                        padding: const EdgeInsets.only(left: 18, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Balance", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicWhiteColor),),),
                            Text("Rp.69.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: HumiColors.humicWhiteColor),),),
                          ],
                        ),
                      ),

                      Container(
                        width: 172,
                        height: 117,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: HumiColors.humicPrimaryColor,
                          )
                        ),
                        padding: const EdgeInsets.only(left: 18, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Monthly Expenses", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicBlackColor),),),
                            Text("Rp.69.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: HumiColors.humicBlackColor),),),
                          ],
                        ),
                      ),
                  ]
                ),
                verticalSpace(24),

                Text("Transaction History", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: HumiColors.humicBlackColor)),),
                verticalSpace(18),

                // First History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp600.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),
                
                // Second History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp450.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFFEA9B4D).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Pending", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFEA9B4D))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Third History
                GestureDetector(
                  onTap: () => Get.to(() => const ExpensesScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicExpensesSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Expenses", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp700.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: HumiColors.humicPrimaryColor.withOpacity(0.16),
                          ),
                          child: Center(child: Text("Denied", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Fourth History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp10.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Fifth History
                GestureDetector(
                  onTap: () => Get.to(() => const ExpensesScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            
                            const Image(image: AssetImage(HumicImages.humicExpensesSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Expenses", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp300.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: HumiColors.humicPrimaryColor.withOpacity(0.16),
                          ),
                          child: Center(child: Text("Denied", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),
                
                // Sixth History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp50.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFFEA9B4D).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Pending", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFEA9B4D))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Seventh History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp200.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Eighth History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            Image(image: const AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp400.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Ninenth History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp100.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Tententh History
                GestureDetector(
                  onTap: () => Get.to(() => const IncomeScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(image: AssetImage(HumicImages.humicIncomeSelectedIcon), color: HumiColors.humicPrimaryColor, width: 32,),
                            Text("Income", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: HumiColors.humicPrimaryColor)),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("03 Okt 2024", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HumiColors.humicPrimaryColor)),),
                            Text("Conference 1", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HumiColors.humicBlackColor)),),
                            Text("Rp900.000.000", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HumiColors.humicTransparencyColor)),)
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(child: Text("Approved", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF48B121))),)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
