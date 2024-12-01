// Function to launch a URL
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    Get.snackbar(
      "Error",
      "Could not open the URL.",
      backgroundColor: HumiColors.humicPrimaryColor,
      colorText: HumiColors.humicWhiteColor,
    );
  }
}
