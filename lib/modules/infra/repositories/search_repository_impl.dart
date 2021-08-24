import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';
import 'package:dartz/dartz.dart';

import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;
  SearchRepositoryImpl(
    this.datasource,
  );

  @override
  Future<Either<FailureSearch, DescriptionChapter>> search(int searchId) async {
    try {
      final result = await datasource.getSearch(searchId);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
