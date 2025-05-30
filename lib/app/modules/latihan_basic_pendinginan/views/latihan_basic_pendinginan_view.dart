import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_basic_pendinginan_controller.dart';

class LatihanBasicPendinginanView
    extends GetView<LatihanBasicPendinginanController> {
  const LatihanBasicPendinginanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBasicPendinginanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatihanBasicPendinginanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
