import 'package:get/get.dart';

import '../controllers/laporan_dospem_controller.dart';

class LaporanDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanDospemController>(
      () => LaporanDospemController(),
    );
  }
}
