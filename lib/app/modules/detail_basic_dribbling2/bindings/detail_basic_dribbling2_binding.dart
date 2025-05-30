import 'package:get/get.dart';

import '../controllers/detail_basic_dribbling2_controller.dart';

class DetailBasicDribbling2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicDribbling2Controller>(
      () => DetailBasicDribbling2Controller(),
    );
  }
}
