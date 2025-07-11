import 'package:get/get.dart';

class LatihannController extends GetxController {
  var selectedLevel = 'Basic'.obs;
  var selectedCategory = ''.obs;
  var searchKeyword = ''.obs;

  RxList<Map<String, dynamic>> allTrainings = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredTrainings = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    applyFilter();

    final argLevel = Get.arguments?['level'];
    if (argLevel != null && (argLevel == 'Basic' || argLevel == 'Intermediate')) {
      selectedLevel.value = argLevel;
    }
  }

  void setLevel(String level) {
    selectedLevel.value = level;
    applyFilter();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    applyFilter();
  }

  void setSearchKeyword(String keyword) {
    searchKeyword.value = keyword;
    applyFilter();
  }

  void applyFilter() {
    final keyword = searchKeyword.value.toLowerCase();

    filteredTrainings.value = allTrainings.where((t) {
      final title = (t['judul'] ?? '').toLowerCase();
      final matchKeyword = title.contains(keyword);
      final matchLevel = t['level'] == selectedLevel.value;
      final matchCategory = selectedCategory.value.isEmpty || t['category'] == selectedCategory.value;
      return matchKeyword && matchLevel && matchCategory;
    }).toList();
  }

  void fetchData() {
    allTrainings.value = [
      {
        'id': '1',
        'judul': 'Jumping Jack',
        'level': 'Basic',
        'image': 'assets/images/jumping.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.3,
        'status': 'belum',
      },
      {
        'id': '2',
        'judul': 'Walking High Knees',
        'level': 'Basic',
        'image': 'assets/images/walking.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.1,
        'status': 'belum',
      },
      {
        'id': '3',
        'judul': 'Knee Hugs',
        'level': 'Basic',
        'image': 'assets/images/kne.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.2,
        'status': 'belum',
      },
      {
        'id': '4',
        'judul': 'Butt Kicks',
        'level': 'Basic',
        'image': 'assets/images/but.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.15,
        'status': 'belum',
      },
      {
        'id': '5',
        'judul': 'Quad Walk',
        'level': 'Basic',
        'image': 'assets/images/quad.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.25,
        'status': 'belum',
      },
      {
        'id': '6',
        'judul': 'Ankle Pops',
        'level': 'Basic',
        'image': 'assets/images/anqle.jpg',
        'duration': '30 sec',
        'category': 'Pemanasan',
        'progress': 0.05,
        'status': 'belum',
      },
      {
        'id': '7',
        'judul': 'Dribbling',
        'level': 'Intermediate',
        'image': 'assets/images/drible.jpg',
        'duration': '40 sec',
        'category': 'Teknik Dasar',
        'progress': 0.0,
        'status': 'belum',
      },
      {
        'id': '8',
        'judul': 'Chest Pass',
        'level': 'Intermediate',
        'image': 'assets/images/ches.jpg',
        'duration': '30 sec',
        'category': 'Teknik Dasar',
        'progress': 0.0,
        'status': 'belum',
      },
      {
        'id': '9',
        'judul': 'Bounce Pass',
        'level': 'Intermediate',
        'image': 'assets/images/bounce.jpg',
        'duration': '30 sec',
        'category': 'Teknik Dasar',
        'progress': 0.0,
        'status': 'belum',
      },
      {
        'id': '10',
        'judul': 'Passing',
        'level': 'Intermediate',
        'image': 'assets/images/passing.jpg',
        'duration': '45 sec',
        'category': 'Teknik Dasar',
        'progress': 0.0,
        'status': 'belum',
      },
      {
        'id': '11',
        'judul': 'Shooting',
        'level': 'Intermediate',
        'image': 'assets/images/shoting.jpg',
        'duration': '45 sec',
        'category': 'Teknik Dasar',
        'progress': 0.0,
        'status': 'belum',
      },
    ];
  }

  void tandaiSelesai(String judul) {
    final index = allTrainings.indexWhere((e) => e['judul'] == judul);
    if (index != -1) {
      allTrainings[index]['status'] = 'selesai';
      allTrainings.refresh();
      applyFilter();
    }
  }

  // 🔒 Fungsi untuk menentukan apakah sebuah latihan terkunci
  bool isLocked(Map<String, dynamic> t) {
    final id = int.tryParse(t['id'].toString()) ?? 0;
    final level = t['level'];

    // ===== BASIC =====
    if (level == 'Basic') {
      if (id == 1) return false; // Jumping Jack terbuka
      final prevId = (id - 1).toString();
      final prev = allTrainings.firstWhereOrNull((e) => e['id'] == prevId);
      return prev == null || prev['status'] != 'selesai';
    }

    // ===== INTERMEDIATE =====
    final anklePops = allTrainings.firstWhereOrNull((e) =>
        e['judul'].toString().toLowerCase() == 'ankle pops' &&
        e['level'] == 'Basic');
    if (anklePops == null || anklePops['status'] != 'selesai') {
      return true; // semua intermediate terkunci sampai ankle pops selesai
    }

    // Dribbling (id 7) terbuka setelah ankle pops selesai
    if (id == 7) return false;

    // Cek apakah latihan sebelumnya sudah selesai
    final prevId = (id - 1).toString();
    final prev = allTrainings.firstWhereOrNull((e) => e['id'] == prevId);
    return prev == null || prev['status'] != 'selesai';
  }
}
