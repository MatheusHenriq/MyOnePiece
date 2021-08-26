import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id_chapters.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource_chapters.dart';
import 'package:animatedcontroller/modules/infra/models/chaptermodel.dart';
import 'package:animatedcontroller/modules/infra/models/descriptionchaptermodel.dart';
import 'package:animatedcontroller/utils/constants.dart';
import 'package:animatedcontroller/utils/sharedpreferecens.dart';
import 'package:get/get.dart';

class ChooseChapterController extends GetxController with StateMixin {
  List<ChapterModel> chapterList = [];
  DescriptionChapterModel chapterUnit;

  final externaldataAllChapter = Get.find<SearchDatasourceChapters>();
  final usercasedataAllChapter = Get.find<SearchByIdChapters>();
  final datasourcedataAllChapter = Get.find<SearchRepositoryChapters>();

  bool _chapterload = false;
  RxBool _isSearching = false.obs;
  bool get chapterload => _chapterload;

  Future<bool> getChapters() async {
    var validator = await usercasedataAllChapter();

    if (validator.isRight()) {
      var data = await datasourcedataAllChapter.search();
      if (data.isRight()) {
        var datalogin = await externaldataAllChapter.getSearch();
        if (datalogin != null) {
          chapterList = datalogin;
          _chapterload = true;
          return true;
        }
      }
    }
    update(['chapterload']);
    return false;
  }

  final externaldataSpecificChapter = Get.find<SearchDatasource>();
  final usercaseSpecificChapter = Get.find<SearchById>();
  final datasourceSpecificChapter = Get.find<SearchRepository>();

  bool _chapterunitload = false;
  RxBool get isSearching => _isSearching;
  bool get chapterunitload => _chapterunitload;

  searchingToggle(bool state) {
    if (state == null) {
      _isSearching.toggle();
    } else {
      _isSearching = state.obs;
    }

    update(['searching']);
  }

  falseChapterUnitLoad() {
    _chapterunitload = false;
  }

  getSpecificChapter(int id) async {
    var validator = await usercaseSpecificChapter(id);
    if (validator.isRight()) {
      update(['chapterunitload']);
      var data = await datasourceSpecificChapter.search(id);
      if (data.isRight()) {
        var datalogin = await externaldataSpecificChapter.getSearch(id);
        if (datalogin != null) {
          update(['chapterunitload']);
          chapterUnit = datalogin;
        }
      }
    }
    _chapterunitload = true;
  }

  RxBool _isDarkMode = false.obs;
  RxBool get isDarkMode => _isDarkMode;
  changeThemeMode() {
    _isDarkMode.toggle();
    if (_isDarkMode == true.obs) {
      Get.changeTheme(appDarkTheme);
    } else {
      Get.changeTheme(appLightTheme);
    }
    PersistDataSharedPreferences.setThemeMode(_isDarkMode.value);
    update(['searching']);
  }

  getSharedPrefereces() async {
    if (PersistDataSharedPreferences.getThemeMode() == null) {
      _isDarkMode = false.obs;
    } else {
      _isDarkMode = PersistDataSharedPreferences.getThemeMode().obs;
    }
    if (_isDarkMode == true.obs) {
      Get.changeTheme(appDarkTheme);
    } else {
      Get.changeTheme(appLightTheme);
    }
    update(['searching']);
  }
}
