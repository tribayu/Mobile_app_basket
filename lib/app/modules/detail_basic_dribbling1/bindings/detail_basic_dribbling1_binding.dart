import 'package:get/get.dart';

import '../controllers/detail_basic_dribbling1_controller.dart';

class DetailBasicDribbling1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicDribbling1Controller>(
      () => DetailBasicDribbling1Controller(),
    );
  }
}
