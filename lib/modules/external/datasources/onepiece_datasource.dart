import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource_chapters.dart';
import 'package:animatedcontroller/modules/infra/models/chaptermodel.dart';
import 'package:dio/dio.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource.dart';
import 'package:animatedcontroller/modules/infra/models/descriptionchaptermodel.dart';

class OnePieceDataSource implements SearchDatasource {
  final Dio dio;
  OnePieceDataSource(
    this.dio,
  );

  @override
  Future<DescriptionChapterModel> getSearch(int searchId) async {
    final response =
        await dio.get('https://onepiececover.com/api/chapters/$searchId');
    if (response.statusCode == 200) {
      DescriptionChapterModel chapter =
          DescriptionChapterModel.fromMap(response.data);
      return chapter;
    } else {
      throw DatasourceError();
    }
  }
}

class OnePieceDataSourceChapter implements SearchDatasourceChapters {
  final Dio dio;
  OnePieceDataSourceChapter(
    this.dio,
  );

  @override
  Future<List<ChapterModel>> getSearch() async {
    final response =
        await dio.get('https://onepiececover.com/api/chapters/all');

    if (response.statusCode == 200) {
      return (response.data['items'] as List)
          .map((e) => ChapterModel.fromMap(e))
          .toList();
    } else {
      throw DatasourceError();
    }
  }
}
