import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  SearchRepositoryMock repository = SearchRepositoryMock();
  final usecase = SearchByIdImpl(repository);
  test('deve retornar uma instância de DescriptionChapter', () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => Right(DescriptionChapter()));

    final result = await usecase(1);
    expect(result | null, isA<DescriptionChapter>());
  });
  test('deve retornar uma InvalidChapterError caso o número seja inválido',
      () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => Right(DescriptionChapter()));

    final result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidChapterError>());
  });
}
