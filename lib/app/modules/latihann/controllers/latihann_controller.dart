import 'package:get/get.dart';

class LatihannController extends GetxController {
  var selectedLevel = 'Basic'.obs;
  var selectedCategory = ''.obs;
  var searchKeyword = ''.obs;

  final basicLatihan= [
    // ===== Basic =====
    {
      'title': 'Jumping Jack & Jogging',
      'image': 'assets/images/jump.jpg',
      'duration': '5 min',
      'label': 'Beginner Friendly',
      'level': 'Basic',
      'category': 'Pemanasan',
      'progress': 0.0,
      'description': 'Latihan dimulai dengan gerakan jumping jacks untuk meningkatkan detak jantung dan suhu tubuh, diikuti jogging ringan di tempat untuk mengaktifkan otot-otot utama. Gerakan ini sederhana namun efektif untuk memulai sesi dengan tubuh yang aktif dan siap..',
      'goals': 'Meningkatkan  sirkulasi darah,aktifitas otot,mencegah cedera.',
    },
    {
      'title': 'Dynamic Stretching',
      'image': 'assets/images/dynamic.jpg',
      'duration': '4 min',
      'label': 'Basic Training',
      'level': 'Basic',
      'category': 'Pemanasan',
      'progress': 0.0,
      'description': 'Lakukan peregangan aktif seperti arm circles (putaran tangan), leg swings (ayunan kaki), lunges ringan, dan torso twist. Tidak seperti peregangan statis, dynamic stretching menggerakkan otot dalam rentang gerak alami.',
      'goals':'Meningkatkan fleksibilitas dan mobilitas sendi sebelum latihan teknis',
    },
    {
      'title': 'Triple Threat Position',
      'image': 'assets/images/triple.jpg',
      'duration': '2 min',
      'label': 'Control & Position',
      'level': 'Basic',
      'category': 'Kontrol & Posisi dasar',
      'progress': 0.0,
      'description': 'Posisi "Triple Threat" adalah posisi dasar saat pemain memegang bola. Pemain berdiri sedikit menekuk lutut, satu kaki sedikit di depan, dan kedua tangan siap menggiring, mengoper, atau menembak. Ini adalah posisi strategis yang memberi banyak pilihan saat bermain.',
      'goals':'Memberikan kesiapan taktis saat memegang bola.',
    },
    {
      'title': 'Slide & Pivot',
      'image': 'assets/images/pivot.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Kontrol & Posisi dasar',
      'progress': 0.0,
      'description': 'Latihan footwork meliputi defensive slide (langkah menyamping), pivot (memutar dengan satu kaki sebagai poros), dan quick steps. Fokus pada kontrol arah, koordinasi, dan stabilitas saat bergerak.',
      'goals':'Mengembangkan keseimbangan, koordinasi, dan pergerakan defensif.',
    },
    {
      'title': 'Dribble Statis',
      'image': 'assets/images/drible.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Dribbling',
      'progress': 0.0,
      'description': 'Latihan dimulai dengan menggiring bola di tempat menggunakan tangan dominan, kemudian tangan non-dominan. Fokus pada kontrol bola, posisi tubuh (menunduk, lutut menekuk), dan pandangan ke depan.',
      'goals':'Melatih kontrol bola dan membangun kekuatan tangan kiri-kanan secara seimbang.',
    },
    {
      'title': 'Crossover',
      'image': 'assets/images/ches.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Dribbling',
      'progress': 0.0,
      'description': 'Latihan crossover mengajarkan pemain memindahkan bola dari satu tangan ke tangan lainnya di depan tubuh saat berjalan. Fokus pada kontrol, timing, dan menjaga bola tetap rendah agar tidak mudah direbut lawan.',
      'goals':'Meningkatkan kemampuan transisi tangan saat menggiring dan menghindari lawan.',
    },
    {
      'title': 'Chest pass',
      'image': 'assets/images/ches.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Passing',
      'progress': 0.0,
      'description': 'Posisi tubuh sejajar dengan tembok, pegang bola di depan dada dan lempar lurus ke arah dinding. Fokus pada posisi siku, gerakan pergelangan tangan, dan akurasi lemparan. Bisa dilakukan berulang.',
      'goals':'Membangun kekuatan dan presisi operan lurus (chest pass).',
    },
    {
      'title': 'Bounce pass',
      'image': 'assets/images/bounce.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Passing',
      'progress': 0.0,
      'description': 'Latihan pantulan bola yang dilempar ke lantai agar memantul ke arah sasaran (misalnya titik X di dinding atau cone). Teknik ini digunakan saat lawan menghadang jalur passing lurus.',
      'goals':'Melatih variasi operan dan mengasah kontrol arah operan.',
    },
    {
      'title': 'Shooting form',
      'image': 'assets/images/form.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Shooting',
      'progress': 0.0,
      'description': 'Latihan gerakan shooting tanpa bola. Fokus pada posisi jari, pergelangan, dan follow-through (gerakan lanjutan setelah bola dilepas). Penting untuk melatih memori otot sebelum menggunakan bola sungguhan.',
      'goals':' Memperkuat teknik shooting dari segi gerakan tangan dan posisi tubuh.',
    },
    {
      'title': 'Stretching ringan',
      'image': 'assets/images/ches.jpg',
      'duration': '2 min',
      'label': 'Control & Movement',
      'level': 'Basic',
      'category': 'Pendinginan',
      'progress': 0.0,
      'description': 'Peregangan otot secara perlahan, mulai dari kaki, tangan, bahu, hingga punggung. Bisa dilakukan sambil duduk atau berdiri. Bernafas perlahan selama melakukan gerakan.',
      'goals':'Mengurangi ketegangan otot, mempercepat pemulihan, dan mencegah nyeri otot setelah latihan.',
    },

    // ===== Intermediate =====
    {
      'title': 'Combo Dribble Cone',
      'image': 'assets/images/combo.jpg',
      'duration': '3 min',
      'label': 'Footwork & Speed',
      'level': 'Intermediate',
      'category': 'Dribbling',
      'progress': 0.0,
      'description': 'Latihan menggiring bola di tempat dengan kombinasi gerakan: kanan–kiri–crossover–behind the back–between the legs (jika mampu). Dilakukan dengan durasi 30 detik per kombinasi lalu istirahat 15 detik. Fokus tetap pada kontrol dan posisi tubuh rendah',
      'goals':'Meningkatkan kelincahan tangan dan variasi dribble.',
    },
    {
      'title': 'Wall Passing',
      'image': 'assets/images/wall.jpg',
      'duration': '2 min',
      'label': 'Accuracy',
      'level': 'Intermediate',
      'category': 'Passing',
      'progress': 0.0,
      'description': 'Gunakan dinding untuk melakukan chest pass dan bounce pass secara bergantian. Ulangi masing-masing 20–30 kali. Pastikan posisi tangan dan siku tepat, bola dilempar dan ditangkap kembali tanpa menjatuhkan.',
      'goals':'Meningkatkan akurasi dan konsistensi operan.',
    },
    {
      'title': 'Form Shooting',
      'image': 'assets/images/formshot.jpg',
      'duration': '2 min',
      'label': 'Shooting Practice',
      'level': 'Intermediate',
      'category': 'Shooting',
      'progress': 0.0,
      'description': 'Lakukan tembakan jarak dekat (jika ada ring) atau gerakan shooting dengan bola ke arah dinding/target visual. Fokus pada follow-through, posisi tangan, dan keseimbangan. Bisa gunakan garis di dinding sebagai acuan arah.',
      'goals':' Menstabilkan teknik tembakan',
    },
    {
      'title': 'Shadow Defense',
      'image': 'assets/images/shadow.jpg',
      'duration': '3 min',
      'label': 'Defense Skill',
      'level': 'Intermediate',
      'category': 'Kontrol & Posisi dasar',
      'progress': 0.0,
      'description': 'Lakukan gerakan defensive slide (langkah menyamping) dari satu sisi ke sisi lain selama 30 detik per sesi. Posisi tubuh tetap rendah, tangan terbuka, kaki aktif bergerak tanpa menyilang.',
      'goals':'Menguatkan posisi bertahan,',
    },
  ];

  RxList<Map<String, dynamic>> filteredTrainings = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Ambil level dari arguments jika dikirimkan
    final argLevel = Get.arguments?['level'];
    if (argLevel != null && (argLevel == 'Basic' || argLevel == 'Intermediate')) {
      selectedLevel.value = argLevel;
    }

    applyFilter();
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

    filteredTrainings.value = basicLatihan.where((t) {
      final title = (t['title'] as String).toLowerCase();
      final matchKeyword = title.contains(keyword);
      final matchLevel = t['level'] == selectedLevel.value;
      final matchCategory = selectedCategory.value.isEmpty || t['category'] == selectedCategory.value;
      return matchKeyword && matchLevel && matchCategory;
    }).toList();
  }
}
