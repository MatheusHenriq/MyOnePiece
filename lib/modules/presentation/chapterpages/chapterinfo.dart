import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
import 'package:animatedcontroller/modules/presentation/chapterpages/textanddescritption.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterInfo extends StatefulWidget {
  final int chapterId;
  const ChapterInfo({
    this.chapterId = 1,
    Key key,
  }) : super(key: key);

  @override
  _ChapterInfoState createState() => _ChapterInfoState();
}

class _ChapterInfoState extends State<ChapterInfo> {
  final ChooseChapterController controller = Get.put(ChooseChapterController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        controller.getSpecificChapter(widget.chapterId);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseChapterController>(
        id: 'chapterunitload',
        init: controller,
        builder: (_) {
          if (_.chapterunitload) {
            return Material(
              color: Theme.of(context).highlightColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.falseChapterUnitLoad();
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextAndDescription(
                        textAbove: 'Chapter:',
                        textBelow: '  ${controller.chapterUnit.id}',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextAndDescription(
                        textAbove: 'Title:',
                        textBelow: '  ${controller.chapterUnit.title}',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).hintColor)),
                          height: 500,
                          width: double.infinity,
                          child: Image.network(
                            '${controller.chapterUnit.cover_images.split("|")[0]}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextAndDescription(
                        textAbove: 'Explanation:',
                        textBelow: '  ${controller.chapterUnit.explanation}',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextAndDescription(
                        textAbove: 'Characters:',
                        textBelow: '  ${controller.chapterUnit.characters}',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextAndDescription(
                        textAbove: 'Summary:',
                        textBelow:
                            '  ${controller.chapterUnit.summary.replaceAll("<p>", "  ").replaceAll("</p>", "").replaceAll("</b>", "").replaceAll("<b>", "").replaceAll("<h5>", " ").replaceAll("</h5>", "").replaceAll("</i>", "").replaceAll("<i>", " ")}',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextAndDescription(
                        textAbove: 'Cover Characters:',
                        textBelow:
                            '  ${controller.chapterUnit.cover_characters}',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Material(
            color: Theme.of(context).highlightColor,
          );
        });
  }
}
