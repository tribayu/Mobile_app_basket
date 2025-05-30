import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_basic_shooting_controller.dart';

class LatihanBasicShootingView extends GetView<LatihanBasicShootingController> {
  const LatihanBasicShootingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBasicShootingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatihanBasicShootingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
