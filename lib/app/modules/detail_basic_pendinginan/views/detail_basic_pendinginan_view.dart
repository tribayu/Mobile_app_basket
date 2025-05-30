import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_basic_pendinginan_controller.dart';

class DetailBasicPendinginanView
    extends GetView<DetailBasicPendinginanController> {
  const DetailBasicPendinginanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBasicPendinginanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBasicPendinginanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
