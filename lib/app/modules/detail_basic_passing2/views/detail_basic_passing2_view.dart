import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_passing2_controller.dart';

class DetailBasicPassing2View extends GetView<DetailBasicPassing2Controller> {
  const DetailBasicPassing2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicPassing2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicPassing2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
