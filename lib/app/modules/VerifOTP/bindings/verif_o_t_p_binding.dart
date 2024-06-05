import 'package:get/get.dart';

import '../controllers/verif_o_t_p_controller.dart';

class VerifOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifOTPController>(
      () => VerifOTPController(),
    );
  }
}
