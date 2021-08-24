import 'dart:convert';

import 'package:animatedcontroller/modules/domain/entities/chapters.dart';

class ChapterModel implements Chapter {
  final String chapter;
  int id;
  final String title;
  ChapterModel({
    this.chapter,
    this.id,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'chapter': chapter,
      'id': id,
      'title': title,
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      chapter: map['chapter'],
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterModel.fromJson(String source) =>
      ChapterModel.fromMap(json.decode(source));
}
