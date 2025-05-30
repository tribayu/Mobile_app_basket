import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_passing1_controller.dart';

class DetailBasicPassing1View extends GetView<DetailBasicPassing1Controller> {
  const DetailBasicPassing1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicPassing1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicPassing1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
