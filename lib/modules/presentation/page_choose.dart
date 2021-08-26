import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
import 'package:animatedcontroller/modules/presentation/choose_chapter.dart';
import 'package:animatedcontroller/modules/presentation/connectwidgets/connecting_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageChooser extends StatefulWidget {
  PageChooser({Key key}) : super(key: key);

  @override
  _PageChooserState createState() => _PageChooserState();
}

class _PageChooserState extends State<PageChooser> {
  final ChooseChapterController controller = Get.put(ChooseChapterController());
  @override
  void initState() {
    controller.getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getChapters(),
      builder: (ctx, snapshot) {
        Widget retVal;
        if (snapshot.data == true) {
          retVal = ChooseChapter();
        } else {
          retVal = ConnectingData();
        }
        return retVal;
      },
    );
  }
}
