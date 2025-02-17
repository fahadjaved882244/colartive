// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Template {
  final String fontFamily; // UNIQUE use as ID
  final String fontFilePath;
  final double fontSize;
  final List<int> charCodes;

  // For display
  final String name;
  final String thumbnailPath;

  const Template({
    required this.fontFamily,
    required this.fontFilePath,
    required this.fontSize,
    required this.charCodes,
    required this.name,
    required this.thumbnailPath,
  });

  Template copyWith({
    String? fontFamily,
    String? fontFilePath,
    double? fontSize,
    List<int>? charCodes,
    String? name,
    String? thumbnailPath,
  }) {
    return Template(
      fontFamily: fontFamily ?? this.fontFamily,
      fontFilePath: fontFilePath ?? this.fontFilePath,
      fontSize: fontSize ?? this.fontSize,
      charCodes: charCodes ?? this.charCodes,
      name: name ?? this.name,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fontFamily': fontFamily,
      'fontFilePath': fontFilePath,
      'fontSize': fontSize,
      'charCodes': charCodes,
      'name': name,
      'thumbnailPath': thumbnailPath,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      fontFamily: map['fontFamily'] as String,
      fontFilePath: map['fontFilePath'] as String,
      fontSize: map['fontSize'] as double,
      charCodes: List<int>.from((map['charCodes'] as List<int>)),
      name: map['name'] as String,
      thumbnailPath: map['thumbnailPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) =>
      Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Template(fontFamily: $fontFamily, fontFilePath: $fontFilePath, fontSize: $fontSize, charCodes: $charCodes, name: $name, thumbnailPath: $thumbnailPath)';
  }

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.fontFamily == fontFamily &&
        other.fontFilePath == fontFilePath &&
        other.fontSize == fontSize &&
        listEquals(other.charCodes, charCodes) &&
        other.name == name &&
        other.thumbnailPath == thumbnailPath;
  }

  @override
  int get hashCode {
    return fontFamily.hashCode ^
        fontFilePath.hashCode ^
        fontSize.hashCode ^
        charCodes.hashCode ^
        name.hashCode ^
        thumbnailPath.hashCode;
  }
}
