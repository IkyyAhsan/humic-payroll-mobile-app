import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';

class HumicHomeCustomAppBar extends StatelessWidget {
  const HumicHomeCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dashboard",
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: HumiColors.humicBlackColor),
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => const ProfileScreenView()),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const CircleAvatar(
              child: Image(image: AssetImage(HumicImages.humicProfileImage)),
            ),
          ),
        )
      ],
    );
  }
}
