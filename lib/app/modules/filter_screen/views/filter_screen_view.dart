import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:intl/intl.dart';
import '../controllers/filter_screen_controller.dart';

class FilterScreenView extends GetView<FilterScreenController> {
  const FilterScreenView({super.key});

  // Fungsi untuk memformat tanggal
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final FilterScreenController controller = Get.put(FilterScreenController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              Text(
                "Apply Filter",
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: HumiColors.humicBlackColor)),
              ),
              verticalSpace(32),
              const Divider(
                color: HumiColors.humicDividerColor,
                height: 2,
              ),
              verticalSpace(24),
              Text(
                "Type",
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HumiColors.humicBlackColor)),
              ),
              verticalSpace(8),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container for 'All'
                      GestureDetector(
                        onTap: () {
                          controller.updateType('All');
                        },
                        child: Container(
                          width: 114,
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: controller.selectedType.value == 'All'
                                ? HumiColors.humicPrimaryColor
                                : Colors.white,
                            border: Border.all(
                              color: controller.selectedType.value == 'All'
                                  ? HumiColors.humicPrimaryColor
                                  : HumiColors.humicPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'All',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: controller.selectedType.value == 'All'
                                    ? HumiColors.humicWhiteColor
                                    : HumiColors.humicPrimaryColor,
                              )),
                            ),
                          ),
                        ),
                      ),

                      // Container for 'Income'
                      GestureDetector(
                        onTap: () {
                          controller.updateType('Income');
                        },
                        child: Container(
                          width: 114,
                          height: 48,
                          decoration: BoxDecoration(
                            color: controller.selectedType.value == 'Income'
                                ? HumiColors.humicPrimaryColor
                                : HumiColors.humicWhiteColor,
                            border: Border.all(
                              color: controller.selectedType.value == 'Income'
                                  ? HumiColors.humicPrimaryColor
                                  : HumiColors.humicPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Income',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: controller.selectedType.value == 'Income'
                                    ? HumiColors.humicWhiteColor
                                    : HumiColors.humicPrimaryColor,
                              )),
                            ),
                          ),
                        ),
                      ),

                      // Container for 'Expenses'
                      GestureDetector(
                        onTap: () {
                          controller.updateType('Expenses');
                        },
                        child: Container(
                          width: 114,
                          height: 48,
                          decoration: BoxDecoration(
                            color: controller.selectedType.value == 'Expenses'
                                ? HumiColors.humicPrimaryColor
                                : HumiColors.humicWhiteColor,
                            border: Border.all(
                              color: controller.selectedType.value == 'Expenses'
                                  ? HumiColors.humicPrimaryColor
                                  : HumiColors.humicPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Expenses',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color:
                                    controller.selectedType.value == 'Expenses'
                                        ? HumiColors.humicWhiteColor
                                        : HumiColors.humicPrimaryColor,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              verticalSpace(24),
              const Divider(
                color: HumiColors.humicDividerColor,
                height: 2,
              ),
              verticalSpace(18),

              // Date Range Section
              Text(
                "Data Range",
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HumiColors.humicBlackColor)),
              ),
              verticalSpace(20),

              Obx(() => Row(
                    children: [
                      // Start Date Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: controller.startDate.value,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              controller.startDate.value = picked;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    color: Colors.grey),
                                const SizedBox(width: 10),
                                Text(
                                  controller.startDate.value == DateTime.now()
                                      ? "Start Date"
                                      : formatDate(controller.startDate.value),
                                  style: TextStyle(
                                    color: controller.startDate.value ==
                                            DateTime.now()
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('To', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      // End Date Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: controller.endDate.value,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              controller.endDate.value = picked;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    color: Colors.grey),
                                const SizedBox(width: 10),
                                Text(
                                  controller.endDate.value == DateTime.now()
                                      ? "End Date"
                                      : formatDate(controller.endDate.value),
                                  style: TextStyle(
                                    color: controller.endDate.value ==
                                            DateTime.now()
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              verticalSpace(25),

              const Divider(
                color: HumiColors.humicDividerColor,
                height: 2,
              ),

              verticalSpace(25),

              // Cancel and Apply Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 128,
                    height: 43,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.resetFilters();
                        Get.back();
                      },
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
                      onPressed: () {
                        Get.to(() => const BottomNavigationBarView());
                        print(
                            "Filter Applied: ${controller.startDate.value} - ${controller.endDate.value}");
                      },
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
    );
  }
}