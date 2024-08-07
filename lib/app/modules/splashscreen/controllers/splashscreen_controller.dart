import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:bebas/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    String initialRoute = await getInitialRoute();
    Get.offAllNamed(initialRoute);
  }

  Future<String> getInitialRoute() async {
    String? token = await UserInfo().getToken();
    return token == null ? Routes.LOGIN : Routes.BERANDA;
  }

  void increment() => count.value++;
}
