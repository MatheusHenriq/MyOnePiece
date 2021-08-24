abstract class FailureSearch implements Exception {}

class InvalidChapterError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String msg;
  DatasourceError({this.msg});
}
