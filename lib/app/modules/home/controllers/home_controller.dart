import 'package:get/get.dart';
import '../../latihann/controllers/latihann_controller.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  final LatihannController latihanC = Get.put(LatihannController());

  void changeTab(int index) {
    currentIndex.value = index;
  }

  double get totalProgress {
    final selesai = latihanC.allTrainings.where((e) => e['status'] == 'selesai').length;
    final total = latihanC.allTrainings.length;
    return total == 0 ? 0 : selesai / total;
  }

  int get basicDone => latihanC.allTrainings
      .where((e) => e['level'] == 'Basic' && e['status'] == 'selesai')
      .length;

  int get intermediateDone => latihanC.allTrainings
      .where((e) => e['level'] == 'Intermediate' && e['status'] == 'selesai')
      .length;
}
