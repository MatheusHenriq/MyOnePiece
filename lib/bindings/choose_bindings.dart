import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id_chapters.dart';
import 'package:animatedcontroller/modules/external/datasources/onepiece_datasource.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource_chapters.dart';
import 'package:animatedcontroller/modules/infra/repositories/search_repository_chapter_impl.dart';
import 'package:animatedcontroller/modules/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ChapterBinding extends Bindings {
  @override
  void dependencies() {
    ///all Chapters
    Get.lazyPut<SearchByIdChapters>(
      () => SearchByIdChaptersImpl(Get.find<SearchRepositoryChapters>()),
    );
    Get.lazyPut<SearchRepositoryChapters>(
      () => SearchRepositoryChaptersImpl(Get.find<SearchDatasourceChapters>()),
    );
    Get.lazyPut<SearchDatasourceChapters>(
      () => OnePieceDataSourceChapter(Dio()),
    );

    ///specific chapter
    Get.lazyPut<SearchById>(
      () => SearchByIdImpl(Get.find<SearchRepository>()),
    );
    Get.lazyPut<SearchRepository>(
      () => SearchRepositoryImpl(Get.find<SearchDatasource>()),
    );
    Get.lazyPut<SearchDatasource>(
      () => OnePieceDataSource(Dio()),
    );
  }
}
