import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  String initialRoute = await getInitialRoute();

  runApp(
    GetMaterialApp(
      title: "Pendaftaran KKN",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: const ColorScheme.light(primary: Color(0xff2b3f85)),
      ),
    ),
  );
}

Future<String> getInitialRoute() async {
  String? token = await UserInfo().getToken();
  return token == null ? Routes.LOGIN : Routes.BERANDA;
}
