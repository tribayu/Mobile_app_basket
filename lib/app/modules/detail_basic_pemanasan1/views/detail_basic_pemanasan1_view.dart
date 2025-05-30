import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_pemanasan1_controller.dart';

class DetailBasicPemanasan1View
    extends GetView<DetailBasicPemanasan1Controller> {
  const DetailBasicPemanasan1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicPemanasan1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicPemanasan1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
