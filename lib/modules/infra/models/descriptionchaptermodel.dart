import 'dart:convert';
import 'package:animatedcontroller/modules/domain/entities/descriptionchapter.dart';

class DescriptionChapterModel implements DescriptionChapter {
  final int id;
  final String title;
  final String chapter;
  final String cover_images;
  final String summary;
  final String characters;
  final String cover_characters;
  final String publish;
  final String explanation;
  final String created_at;
  final String updated_at;

  DescriptionChapterModel({
    this.id,
    this.title,
    this.chapter,
    this.cover_images,
    this.summary,
    this.characters,
    this.cover_characters,
    this.publish,
    this.explanation,
    this.created_at,
    this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'chapter': chapter,
      'cover_images': cover_images,
      'summary': summary,
      'characters': characters,
      'cover_characters': cover_characters,
      'publish': publish,
      'explanation': explanation,
      'created_at': created_at,
      'updatedAt': updated_at,
    };
  }

  factory DescriptionChapterModel.fromMap(Map<String, dynamic> map) {
    return DescriptionChapterModel(
      id: map['id'],
      title: map['title'],
      chapter: map['chapter'],
      cover_images: map['cover_images'],
      summary: map['summary'],
      characters: map['characters'],
      cover_characters: map['cover_characters'],
      publish: map['publish'],
      explanation: map['explanation'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionChapterModel.fromJson(String source) =>
      DescriptionChapterModel.fromMap(json.decode(source));
}
