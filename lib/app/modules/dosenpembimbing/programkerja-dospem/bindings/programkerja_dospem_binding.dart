import 'package:get/get.dart';

import '../controllers/programkerja_dospem_controller.dart';

class ProgramkerjaDospemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramkerjaDospemController>(
      () => ProgramkerjaDospemController(),
    );
  }
}
