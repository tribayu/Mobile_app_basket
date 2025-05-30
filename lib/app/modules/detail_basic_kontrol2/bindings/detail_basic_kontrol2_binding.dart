import 'package:get/get.dart';

import '../controllers/detail_basic_kontrol2_controller.dart';

class DetailBasicKontrol2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicKontrol2Controller>(
      () => DetailBasicKontrol2Controller(),
    );
  }
}
