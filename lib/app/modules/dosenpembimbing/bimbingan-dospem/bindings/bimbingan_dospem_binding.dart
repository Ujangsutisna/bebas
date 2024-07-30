import 'package:get/get.dart';

import '../controllers/bimbingan_dospem_controller.dart';

class BimbinganDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BimbinganDospemController>(
      () => BimbinganDospemController(),
    );
  }
}
