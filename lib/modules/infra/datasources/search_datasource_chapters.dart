import 'package:animatedcontroller/modules/infra/models/chaptermodel.dart';

abstract class SearchDatasourceChapters {
  Future<List<ChapterModel>> getSearch();
}
