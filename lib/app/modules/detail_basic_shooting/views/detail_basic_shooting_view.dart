import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_shooting_controller.dart';

class DetailBasicShootingView extends GetView<DetailBasicShootingController> {
  const DetailBasicShootingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicShootingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicShootingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
