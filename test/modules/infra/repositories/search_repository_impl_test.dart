import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource.dart';
import 'package:animatedcontroller/modules/infra/models/descriptionchaptermodel.dart';
import 'package:animatedcontroller/modules/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);
  test('deve retornar uma instancia de Chapter', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => Future.value(DescriptionChapterModel()));
    final result = await repository.search(1);
    expect(result | null, isA<DescriptionChapter>());
  });
  test('deve retornar um DatasourceErro se o datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search(1);
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
