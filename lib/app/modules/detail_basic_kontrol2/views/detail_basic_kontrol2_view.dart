import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_kontrol2_controller.dart';

class DetailBasicKontrol2View extends GetView<DetailBasicKontrol2Controller> {
  const DetailBasicKontrol2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicKontrol2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicKontrol2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
