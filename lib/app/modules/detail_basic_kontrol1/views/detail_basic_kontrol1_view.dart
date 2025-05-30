import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_kontrol1_controller.dart';

class DetailBasicKontrol1View extends GetView<DetailBasicKontrol1Controller> {
  const DetailBasicKontrol1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicKontrol1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicKontrol1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
