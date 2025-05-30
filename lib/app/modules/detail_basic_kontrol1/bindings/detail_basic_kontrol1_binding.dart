import 'package:get/get.dart';

import '../controllers/detail_basic_kontrol1_controller.dart';

class DetailBasicKontrol1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicKontrol1Controller>(
      () => DetailBasicKontrol1Controller(),
    );
  }
}
