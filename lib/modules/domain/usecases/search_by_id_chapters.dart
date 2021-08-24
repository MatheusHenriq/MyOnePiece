import 'package:animatedcontroller/modules/domain/entities/chapters.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByIdChapters {
  Future<Either<FailureSearch, List<Chapter>>> call();
}

class SearchByIdChaptersImpl implements SearchByIdChapters {
  final SearchRepositoryChapters repository;

  SearchByIdChaptersImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<Chapter>>> call() async {
    return repository.search();
  }
}
