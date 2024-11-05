import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class HumicCustomAppBar extends StatelessWidget {
  const HumicCustomAppBar({
    super.key,
    required this.title,
    this.image,
  });

  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
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
            child: CircleAvatar(
                radius: 100, backgroundImage: NetworkImage(image ?? "")),
          ),
        ),
      ],
    );
  }
}
