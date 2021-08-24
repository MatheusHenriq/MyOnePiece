import 'package:dartz/dartz.dart';

import 'package:animatedcontroller/modules/domain/entities/chapters.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource_chapters.dart';

class SearchRepositoryChaptersImpl extends SearchRepositoryChapters {
  final SearchDatasourceChapters datasource;
  SearchRepositoryChaptersImpl(
    this.datasource,
  );

  @override
  Future<Either<FailureSearch, List<Chapter>>> search() async {
    try {
      final result = await datasource.getSearch();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
