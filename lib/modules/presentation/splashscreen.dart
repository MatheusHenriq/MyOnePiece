import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        controllerChapter.getChapters();
        controllerChapter.getSharedPrefereces();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseChapterController>(
      id: 'chapterload',
      builder: (_) {
        if (_.chapterload == true) {
          return ChooseChapter();
        } else {
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
      },
    );
  }
}
