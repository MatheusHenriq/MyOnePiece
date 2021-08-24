import 'package:animatedcontroller/modules/infra/models/descriptionchaptermodel.dart';

abstract class SearchDatasource {
  Future<DescriptionChapterModel> getSearch(int searchId);
}
