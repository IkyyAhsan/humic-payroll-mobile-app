import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/approval_detail_screen_controller.dart';

class ApprovalDetailScreenView extends GetView<ApprovalDetailScreenController> {
  const ApprovalDetailScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ApprovalDetailScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ApprovalDetailScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ApprovalDetailScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
