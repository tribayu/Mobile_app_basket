import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> latihanList = [
    {
      "title": "Pemanasan",
      "route": "/latihan-basic-pemanasan",
      "image": "assets/images/jump.jpg",
    },
    {
      "title": "Dribbling",
      "route": "/latihan-basic-dribbling",
      "image": "assets/images/jump.jpg",
    },
    {
      "title": "Passing",
      "route": "/latihan-basic-passing",
      "image": "assets/images/jump.jpg",
    },
    {
      "title": "Kontrol",
      "route": "/latihan-basic-kontrol",
      "image": "assets/images/jump.jpg",
    },
    {
      "title": "Shooting",
      "route": "/latihan-basic-shooting",
      "image": "assets/images/jump.jpg",
    },
    {
      "title": "Pendinginan",
      "route": "/latihan-basic-pendinginan",
      "image": "assets/images/jump.jpg",
    },
  ];
  
    void changeTab(int index) {
    currentIndex.value = index;
  }


}
