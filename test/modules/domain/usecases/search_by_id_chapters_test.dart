import 'package:animatedcontroller/modules/domain/entities/chapters.dart';
import 'package:animatedcontroller/modules/domain/repositories/search_repository.dart';
import 'package:animatedcontroller/modules/domain/usecases/search_by_id_chapters.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepositoryChapters {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByIdChaptersImpl(repository);
  test('deve retornar uma lista de chapter', () async {
    when(repository.search()).thenAnswer((_) async => Right(<Chapter>[]));
    final result = await usecase();
    expect(result | null, isA<List<Chapter>>());
  });
}
