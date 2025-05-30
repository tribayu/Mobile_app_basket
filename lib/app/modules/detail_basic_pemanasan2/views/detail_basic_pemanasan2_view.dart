import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_pemanasan2_controller.dart';

class DetailBasicPemanasan2View
    extends GetView<DetailBasicPemanasan2Controller> {
  const DetailBasicPemanasan2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicPemanasan2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicPemanasan2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
