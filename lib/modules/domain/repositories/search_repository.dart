import 'package:animatedcontroller/modules/domain/entities/chapters.dart';
import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, DescriptionChapter>> search(int searchId);
}

abstract class SearchRepositoryChapters {
  Future<Either<FailureSearch, List<Chapter>>> search();
}
