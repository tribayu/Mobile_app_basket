import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_dribbling1_controller.dart';

class DetailBasicDribbling1View
    extends GetView<DetailBasicDribbling1Controller> {
  const DetailBasicDribbling1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicDribbling1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicDribbling1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
