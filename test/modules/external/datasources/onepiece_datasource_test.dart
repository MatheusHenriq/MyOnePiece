import 'dart:convert';
import 'package:animatedcontroller/modules/domain/erros/errors.dart';
import 'package:animatedcontroller/modules/external/datasources/onepiece_datasource.dart';
import 'package:animatedcontroller/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasourceChapter = OnePieceDataSourceChapter(dio);
  final datasource = OnePieceDataSource(dio);
  test('deve retornar uma instância de DescriptionChapterModel', () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: jsonDecode(OnePieceChapterSearch),
        statusCode: 200,
        requestOptions:
            RequestOptions(path: 'https://onepiececover.com/api/chapters/'),
      ),
    );
    final future = datasource.getSearch(1);
    expect(future, completes);
  });

  test('deve retornar um DatasourceError se o código não for 200', () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: null,
        statusCode: 401,
        requestOptions:
            RequestOptions(path: 'https://onepiececover.com/api/chapters/'),
      ),
    );
    final future = datasource.getSearch(1);
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('deve retornar um Exception se tiver algum erro no DIO', () async {
    when(dio.get(any)).thenThrow(Exception());
    final future = datasource.getSearch(1);
    expect(future, throwsA(isA<Exception>()));
  });

  test('deve retornar uma instância de ChaptersModel', () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: jsonDecode(OnePieceChapterSearch2),
        statusCode: 200,
        requestOptions:
            RequestOptions(path: 'https://onepiececover.com/api/chapters/all'),
      ),
    );
    final future = datasourceChapter.getSearch();
    expect(future, completes);
  });

  test(
      'deve retornar um DatasourceError se o código não for 200 para o chaptermodel',
      () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: null,
        statusCode: 401,
        requestOptions:
            RequestOptions(path: 'https://onepiececover.com/api/chapters/all'),
      ),
    );
    final future = datasource.getSearch(1);
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
