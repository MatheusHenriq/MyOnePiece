import 'package:animatedcontroller/modules/domain/entities/chapters.dart';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/infra/datasources/search_datasource_chapters.dart';
import 'package:animatedcontroller/modules/infra/models/chaptermodel.dart';
import 'package:animatedcontroller/modules/infra/repositories/search_repository_chapter_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasourceChapters {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryChaptersImpl(datasource);
  test('deve retornar uma lista de Chapter', () async {
    when(datasource.getSearch())
        .thenAnswer((realInvocation) async => <ChapterModel>[]);
    final result = await repository.search();
    expect(result | null, isA<List<Chapter>>());
  });
  test('deve retornar um error se o datasource falhar ', () async {
    when(datasource.getSearch()).thenThrow(DatasourceError());
    final result = await repository.search();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
