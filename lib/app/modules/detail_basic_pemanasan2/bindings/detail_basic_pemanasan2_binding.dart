import 'package:get/get.dart';

import '../controllers/detail_basic_pemanasan2_controller.dart';

class DetailBasicPemanasan2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicPemanasan2Controller>(
      () => DetailBasicPemanasan2Controller(),
    );
  }
}
