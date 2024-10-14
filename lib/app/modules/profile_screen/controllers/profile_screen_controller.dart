import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final hideOldPassword = true.obs;
  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;
}
