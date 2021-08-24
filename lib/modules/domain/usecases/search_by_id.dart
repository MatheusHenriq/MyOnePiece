import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchById {
  Future<Either<FailureSearch, DescriptionChapter>> call(int searchId);
}

class SearchByIdImpl implements SearchById {
  final SearchRepository repository;

  SearchByIdImpl(this.repository);

  @override
  Future<Either<FailureSearch, DescriptionChapter>> call(int searchId) async {
    if (searchId == null) {
      return Left(InvalidChapterError());
    }
    return repository.search(searchId);
  }
}
