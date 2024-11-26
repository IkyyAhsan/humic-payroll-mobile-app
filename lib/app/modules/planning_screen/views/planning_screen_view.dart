import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/home_custom_appbar.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/planning_add_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/views/widgets/planning_data.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:lottie/lottie.dart';
import '../controllers/planning_screen_controller.dart';

class PlanningScreenView extends GetView<PlanningScreenController> {
  const PlanningScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PlanningScreenController());

    return Obx(
      () {
        return controller.isLoading.value
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(
                    color: HumiColors.humicPrimaryColor,
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: HumiColors.humicBackgroundColor,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: HumiColors.humicPrimaryColor,
                            ),
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(24),
                              HumicCustomAppBar(
                                title: 'Planning',

                                // Filter Tahun
                                widget: GestureDetector(
                                  onTap: () async {
                                    final int? pickedYear =
                                        await showModalBottomSheet<int>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        int tempYear = controller
                                            .selectedPlanningYear.value;
                                        return Container(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Select Year',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Expanded(
                                                child: Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .copyWith(
                                                              primary: Colors
                                                                  .red, // Ubah warna menjadi merah
                                                            ),
                                                    textTheme: const TextTheme(
                                                      bodyMedium: TextStyle(
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  child: YearPicker(
                                                    firstDate: DateTime(2010),
                                                    lastDate: DateTime(2050),
                                                    initialDate:
                                                        DateTime(tempYear),
                                                    selectedDate:
                                                        DateTime(tempYear),
                                                    onChanged: (DateTime date) {
                                                      Navigator.pop(
                                                          context, date.year);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                    if (pickedYear != null &&
                                        pickedYear !=
                                            controller
                                                .selectedPlanningYear.value) {
                                      controller.updatePlanningYear(pickedYear);
                                    }
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: HumiColors.humicDividerColor),
                                    ),

                                    // Data Tahun
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: HumiColors
                                            .humicBackgroundColor, // Warna latar belakang dropdown
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<int>(
                                          value: controller
                                              .selectedPlanningYear.value,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 1,
                                            color: HumiColors
                                                .humicBackgroundColor, // Sesuaikan warna ikon
                                          ),
                                          onChanged: (int? newValue) {
                                            if (newValue != null &&
                                                newValue !=
                                                    controller
                                                        .selectedPlanningYear
                                                        .value) {
                                              controller
                                                  .updatePlanningYear(newValue);
                                            }
                                          },
                                          isExpanded: true,
                                          alignment: Alignment.center,
                                          items: List.generate(
                                            5,
                                            (index) =>
                                                DateTime.now().year - index,
                                          ).map<DropdownMenuItem<int>>(
                                              (int year) {
                                            return DropdownMenuItem<int>(
                                              value: year,
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    horizontalSpace(10),
                                                    Iconify(
                                                      Uil.calender,
                                                      size: 16,
                                                    ),
                                                    horizontalSpace(5),
                                                    Text(
                                                      "$year",
                                                      style: GoogleFonts
                                                          .plusJakartaSans(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: HumiColors
                                                              .humicBlackColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpace(34),
                              if (controller.pageData.isEmpty)
                                Center(
                                  child: Column(
                                    children: [
                                      verticalSpace(150),
                                      Lottie.asset(
                                          HumicImages.humicDataNotFound,
                                          height: 170),
                                    ],
                                  ),
                                )
                              else
                                const HumicPlanningData(),
                              verticalSpace(16),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                floatingActionButton: SizedBox(
                  width: 138,
                  height: 51,
                  child: FloatingActionButton(
                    onPressed: () => Get.to(
                      const PlanningAddScreenView(),
                    ),
                    backgroundColor: HumiColors.humicPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.add_24_regular,
                          color: HumiColors.humicWhiteColor,
                        ),
                        horizontalSpace(4),
                        Text(
                          "Add Plan",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicWhiteColor)),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
