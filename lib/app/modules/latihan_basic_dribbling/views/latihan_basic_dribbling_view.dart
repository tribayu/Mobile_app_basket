import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_basic_dribbling_controller.dart';

class LatihanBasicDribblingView
    extends GetView<LatihanBasicDribblingController> {
  const LatihanBasicDribblingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBasicDribblingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatihanBasicDribblingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
