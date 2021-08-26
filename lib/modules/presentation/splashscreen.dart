import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
import 'package:animatedcontroller/controllers/splashscreen_controller.dart';
import 'package:animatedcontroller/modules/presentation/choose_chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animatedcontroller/animationimage.dart';
import 'animatedcontroller/sun_rolling.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ChooseChapterController controllerChapter =
      Get.put(ChooseChapterController());
  final SplashScreenController controllerSplash =
      Get.put(SplashScreenController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        controllerSplash.timerFunction();
        controllerChapter.getSharedPrefereces();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/one piece2.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: AnitationImage(),
              ),
              Center(
                child: RollingImage(
                  imageUrl: 'assets/images/leme.png',
                  height: 250,
                  width: 250,
                  duration: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
