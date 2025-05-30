import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_basic_kontrol_controller.dart';

class LatihanBasicKontrolView extends GetView<LatihanBasicKontrolController> {
  const LatihanBasicKontrolView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBasicKontrolView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatihanBasicKontrolView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
