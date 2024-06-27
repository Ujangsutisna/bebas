import 'package:get/get.dart';

import '../modules/Daftarkkn/bindings/daftarkkn_binding.dart';
import '../modules/Daftarkkn/views/daftarkkn_view.dart';
import '../modules/GantiPassword/bindings/ganti_password_binding.dart';
import '../modules/GantiPassword/views/ganti_password_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/UbahPassword/bindings/ubah_password_binding.dart';
import '../modules/UbahPassword/views/ubah_password_view.dart';
import '../modules/VerifOTP/bindings/verif_o_t_p_binding.dart';
import '../modules/VerifOTP/views/verif_o_t_p_view.dart';
import '../modules/beranda/bindings/beranda_binding.dart';
import '../modules/beranda/views/beranda_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => const BerandaView(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_PASSWORD,
      page: () => const GantiPasswordView(),
      binding: GantiPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIF_O_T_P,
      page: () => const VerifOTPView(),
      binding: VerifOTPBinding(),
    ),
    GetPage(
      name: _Paths.DAFTARKKN,
      page: () => const DaftarkknView(),
      binding: DaftarkknBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => const UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
  ];
}
