import 'package:get/get.dart';

import '../controllers/daftarkkn_controller.dart';

class DaftarkknBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarkknController>(
      () => DaftarkknController(),
    );
  }
}
