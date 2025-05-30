import 'package:basketball/app/modules/register/bindings/register_binding.dart';
import 'package:basketball/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

import '../modules/detail_basic_dribbling1/bindings/detail_basic_dribbling1_binding.dart';
import '../modules/detail_basic_dribbling1/views/detail_basic_dribbling1_view.dart';
import '../modules/detail_basic_dribbling2/bindings/detail_basic_dribbling2_binding.dart';
import '../modules/detail_basic_dribbling2/views/detail_basic_dribbling2_view.dart';
import '../modules/detail_basic_kontrol1/bindings/detail_basic_kontrol1_binding.dart';
import '../modules/detail_basic_kontrol1/views/detail_basic_kontrol1_view.dart';
import '../modules/detail_basic_kontrol2/bindings/detail_basic_kontrol2_binding.dart';
import '../modules/detail_basic_kontrol2/views/detail_basic_kontrol2_view.dart';
import '../modules/detail_basic_passing1/bindings/detail_basic_passing1_binding.dart';
import '../modules/detail_basic_passing1/views/detail_basic_passing1_view.dart';
import '../modules/detail_basic_passing2/bindings/detail_basic_passing2_binding.dart';
import '../modules/detail_basic_passing2/views/detail_basic_passing2_view.dart';
import '../modules/detail_basic_pemanasan1/bindings/detail_basic_pemanasan1_binding.dart';
import '../modules/detail_basic_pemanasan1/views/detail_basic_pemanasan1_view.dart';
import '../modules/detail_basic_pemanasan2/bindings/detail_basic_pemanasan2_binding.dart';
import '../modules/detail_basic_pemanasan2/views/detail_basic_pemanasan2_view.dart';
import '../modules/detail_basic_pendinginan/bindings/detail_basic_pendinginan_binding.dart';
import '../modules/detail_basic_pendinginan/views/detail_basic_pendinginan_view.dart';
import '../modules/detail_basic_shooting/bindings/detail_basic_shooting_binding.dart';
import '../modules/detail_basic_shooting/views/detail_basic_shooting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/latihan_basic_dribbling/bindings/latihan_basic_dribbling_binding.dart';
import '../modules/latihan_basic_dribbling/views/latihan_basic_dribbling_view.dart';
import '../modules/latihan_basic_kontrol/bindings/latihan_basic_kontrol_binding.dart';
import '../modules/latihan_basic_kontrol/views/latihan_basic_kontrol_view.dart';
import '../modules/latihan_basic_passing/bindings/latihan_basic_passing_binding.dart';
import '../modules/latihan_basic_passing/views/latihan_basic_passing_view.dart';
import '../modules/latihan_basic_pemanasan/bindings/latihan_basic_pemanasan_binding.dart';
import '../modules/latihan_basic_pemanasan/views/latihan_basic_pemanasan_view.dart';
import '../modules/latihan_basic_pendinginan/bindings/latihan_basic_pendinginan_binding.dart';
import '../modules/latihan_basic_pendinginan/views/latihan_basic_pendinginan_view.dart';
import '../modules/latihan_basic_shooting/bindings/latihan_basic_shooting_binding.dart';
import '../modules/latihan_basic_shooting/views/latihan_basic_shooting_view.dart';
import '../modules/latihann/bindings/latihann_binding.dart';
import '../modules/latihann/views/latihann_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loginn/views/loginn_view.dart';
import '../modules/loginn/bindings/loginn_binding.dart';
import '../modules/detail_latihan/bindings/detail_latihan_binding.dart';
import '../modules/detail_latihan/views/detail_latihan_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGINN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_PEMANASAN,
      page: () => const LatihanBasicPemanasanView(),
      binding: LatihanBasicPemanasanBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_KONTROL,
      page: () => const LatihanBasicKontrolView(),
      binding: LatihanBasicKontrolBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_DRIBBLING,
      page: () => const LatihanBasicDribblingView(),
      binding: LatihanBasicDribblingBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_PASSING,
      page: () => const LatihanBasicPassingView(),
      binding: LatihanBasicPassingBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_SHOOTING,
      page: () => const LatihanBasicShootingView(),
      binding: LatihanBasicShootingBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_BASIC_PENDINGINAN,
      page: () => const LatihanBasicPendinginanView(),
      binding: LatihanBasicPendinginanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_PEMANASAN1,
      page: () => const DetailBasicPemanasan1View(),
      binding: DetailBasicPemanasan1Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_PEMANASAN2,
      page: () => const DetailBasicPemanasan2View(),
      binding: DetailBasicPemanasan2Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_KONTROL1,
      page: () => const DetailBasicKontrol1View(),
      binding: DetailBasicKontrol1Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_KONTROL2,
      page: () => const DetailBasicKontrol2View(),
      binding: DetailBasicKontrol2Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_DRIBBLING1,
      page: () => const DetailBasicDribbling1View(),
      binding: DetailBasicDribbling1Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_DRIBBLING2,
      page: () => const DetailBasicDribbling2View(),
      binding: DetailBasicDribbling2Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_PASSING1,
      page: () => const DetailBasicPassing1View(),
      binding: DetailBasicPassing1Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_PASSING2,
      page: () => const DetailBasicPassing2View(),
      binding: DetailBasicPassing2Binding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_SHOOTING,
      page: () => const DetailBasicShootingView(),
      binding: DetailBasicShootingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BASIC_PENDINGINAN,
      page: () => const DetailBasicPendinginanView(),
      binding: DetailBasicPendinginanBinding(),
    ),
    GetPage(
      name: _Paths.LATIHANN,
      page: () => const LatihannView(),
      binding: LatihannBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
     GetPage(
      name: _Paths.LOGINN,
      page: () => const LoginnView(),
      binding: LoginnBinding(),
    ),
     GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LATIHAN,
      page: () => const DetailLatihanView(),
      binding: DetailLatihanBinding(),
    ),
  ];
}
