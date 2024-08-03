import 'package:get/get.dart';

import '../controllers/jadwalsidang_dospem_controller.dart';

class JadwalsidangDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalsidangDospemController>(
      () => JadwalsidangDospemController(),
    );
  }
}
