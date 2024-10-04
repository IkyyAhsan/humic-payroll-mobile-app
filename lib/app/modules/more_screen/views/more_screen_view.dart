import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_screen_controller.dart';

class MoreScreenView extends GetView<MoreScreenController> {
  const MoreScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoreScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MoreScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
