import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_basic_passing_controller.dart';

class LatihanBasicPassingView extends GetView<LatihanBasicPassingController> {
  const LatihanBasicPassingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBasicPassingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatihanBasicPassingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
