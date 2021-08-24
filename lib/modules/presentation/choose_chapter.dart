import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
import 'package:animatedcontroller/modules/infra/models/chaptermodel.dart';
import 'package:animatedcontroller/modules/presentation/chapterpages/chapterinfo.dart';
import 'package:animatedcontroller/modules/presentation/chapterpages/chapterlessinfo.dart';
import 'package:animatedcontroller/modules/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChooseChapter extends StatefulWidget {
  const ChooseChapter({Key key}) : super(key: key);

  @override
  _ChooseChapterState createState() => _ChooseChapterState();
}

class _ChooseChapterState extends State<ChooseChapter> {
  final ChooseChapterController controller = Get.put(ChooseChapterController());
  List<ChapterModel> chapters;
  String query = '';
  @override
  void initState() {
    chapters = controller.chapterList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetBuilder<ChooseChapterController>(
        id: 'searching',
        init: controller,
        builder: (_) {
          return SafeArea(
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Theme.of(context).accentColor,
                  child: controller.isDarkMode.value == false
                      ? Icon(
                          Icons.light_mode,
                        )
                      : Icon(
                          Icons.dark_mode,
                        ),
                  onPressed: () {
                    controller.changeThemeMode();
                  }),
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: controller.isSearching.value == true
                    ? Container(
                        width: 300,
                        child: SearchWidget(
                          text: query,
                          hintText: 'Search by chapter...',
                          onChanged: searchBook,
                        ),
                      )
                    : Text(
                        'My One Piece',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .apply(color: Colors.white),
                      ),
                centerTitle: true,
                actions: [
                  controller.isSearching.value == true
                      ? SizedBox()
                      : IconButton(
                          onPressed: () {
                            controller.searchingToggle(null);
                          },
                          icon: Icon(Icons.search, color: Colors.white),
                        )
                ],
              ),
              backgroundColor: Theme.of(context).highlightColor,
              body: GestureDetector(
                onTap: () {
                  if (query == '') {
                    controller.searchingToggle(false);
                    chapters = controller.chapterList;
                  }
                },
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20.0,
                            spreadRadius: 10.0,
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/onepiecegang.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: chapters.length == 0
                            ? controller.chapterList.length
                            : chapters.length,
                        itemBuilder: (ctx, index) {
                          return ChapterLessInfo(
                            title: chapters.length == 0
                                ? controller.chapterList[index].title
                                : chapters[index].title,
                            chapter: chapters.length == 0
                                ? controller.chapterList[index].id
                                : chapters[index].id,
                            onTap: () {
                              Get.to(
                                ChapterInfo(
                                  chapterId: (chapters.length == 0
                                      ? controller.chapterList[index].id
                                      : chapters[index].id),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void searchBook(String id) {
    final chapters = controller.chapterList.where((chapter) {
      final chapterId = chapter.id.toString();
      final searchChapterId = id;
      return chapterId.contains(RegExp('^$searchChapterId\$'));
    }).toList();

    setState(() {
      this.query = id;
      this.chapters = chapters;
    });
  }
}
