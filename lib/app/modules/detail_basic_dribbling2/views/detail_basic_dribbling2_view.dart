import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_dribbling2_controller.dart';

class DetailBasicDribbling2View
    extends GetView<DetailBasicDribbling2Controller> {
  const DetailBasicDribbling2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicDribbling2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicDribbling2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
