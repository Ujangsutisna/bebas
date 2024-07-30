import 'package:get/get.dart';

import '../controllers/programkerja_controller.dart';

class ProgramkerjaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramkerjaController>(
      () => ProgramkerjaController(),
    );
  }
}
