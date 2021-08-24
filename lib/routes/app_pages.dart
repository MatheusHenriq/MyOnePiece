import 'package:animatedcontroller/bindings/choose_bindings.dart';
import 'package:animatedcontroller/modules/presentation/choose_chapter.dart';
import 'package:animatedcontroller/modules/presentation/splashscreen.dart';
import 'package:animatedcontroller/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashScreen(),
        binding: ChapterBinding()),
    GetPage(
        name: Routes.CHOOSECHAPTER,
        page: () => ChooseChapter(),
        binding: ChapterBinding()),
  ];
}
