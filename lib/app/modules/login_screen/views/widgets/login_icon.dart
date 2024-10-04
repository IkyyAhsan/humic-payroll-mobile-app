import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';

class HumicLoginIcon extends StatelessWidget {
  const HumicLoginIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        HumicImages.humicLogoNoTitle,
      ),
      height: 106,
    );
  }
}