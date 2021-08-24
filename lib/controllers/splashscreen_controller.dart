import 'dart:async';

import 'package:animatedcontroller/bindings/choose_bindings.dart';
import 'package:animatedcontroller/modules/presentation/choose_chapter.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  timerFunction() {
    Timer(Duration(seconds: 5), () {
      Get.off(ChooseChapter(), binding: ChapterBinding());
    });
  }
}
