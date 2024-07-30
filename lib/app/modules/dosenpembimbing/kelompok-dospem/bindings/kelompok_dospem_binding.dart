import 'package:get/get.dart';

import '../controllers/kelompok_dospem_controller.dart';

class KelompokDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelompokDospemController>(
      () => KelompokDospemController(),
    );
  }
}
