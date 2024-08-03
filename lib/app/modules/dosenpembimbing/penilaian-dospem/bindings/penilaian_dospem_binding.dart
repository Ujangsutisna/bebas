import 'package:get/get.dart';

import '../controllers/penilaian_dospem_controller.dart';

class PenilaianDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianDospemController>(
      () => PenilaianDospemController(),
    );
  }
}
