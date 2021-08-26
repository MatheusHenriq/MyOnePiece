import 'dart:async';
import 'package:animatedcontroller/bindings/choose_bindings.dart';
import 'package:animatedcontroller/modules/presentation/page_choose.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  timerFunction() {
    Timer(Duration(seconds: 4), () {
      Get.off(PageChooser(), binding: ChapterBinding());
    });
  }
}
