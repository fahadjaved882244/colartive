// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Template {
  final String fontFamily;
  final String fontFileUrl;
  final double fontSize;
  final List<int> charCodes;
  final int maxColors;

  // Unique identifier for the template
  final String id;

  // For display
  final String name;
  final String thumbnailUrl;
  final DateTime createdAt;
  final bool isActive;

  const Template({
    required this.id,
    required this.fontFamily,
    required this.fontFileUrl,
    required this.fontSize,
    required this.charCodes,
    required this.maxColors,
    required this.name,
    required this.thumbnailUrl,
    required this.createdAt,
    required this.isActive,
  });

  Template copyWith({
    String? id,
    String? fontFamily,
    String? fontFileUrl,
    double? fontSize,
    List<int>? charCodes,
    int? maxColors,
    String? name,
    String? thumbnailUrl,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return Template(
      id: id ?? this.id,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFileUrl: fontFileUrl ?? this.fontFileUrl,
      fontSize: fontSize ?? this.fontSize,
      charCodes: charCodes ?? this.charCodes,
      maxColors: maxColors ?? this.maxColors,
      name: name ?? this.name,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fontFamily': fontFamily,
      'fontFilePath': fontFileUrl,
      'fontSize': fontSize,
      'charCodes': charCodes,
      'maxColors': maxColors,
      'name': name,
      'thumbnailUrl': thumbnailUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      id: map['id'] as String,
      fontFamily: map['fontFamily'] as String,
      fontFileUrl: map['fontFilePath'] as String,
      fontSize: map['fontSize'] as double,
      charCodes: List<int>.from((map['charCodes'] as List<int>)),
      maxColors: map['maxColors'] as int,
      name: map['name'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String? ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      isActive: map['isActive'] as bool? ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) =>
      Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Template(id: $id, fontFamily: $fontFamily, fontFileUrl: $fontFileUrl, fontSize: $fontSize, charCodes: $charCodes, maxColors: $maxColors, name: $name, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.fontFamily == fontFamily &&
        other.id == id &&
        other.fontFileUrl == fontFileUrl &&
        other.fontSize == fontSize &&
        listEquals(other.charCodes, charCodes) &&
        other.maxColors == maxColors &&
        other.name == name &&
        other.thumbnailUrl == thumbnailUrl &&
        other.createdAt == createdAt &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fontFamily.hashCode ^
        fontFileUrl.hashCode ^
        fontSize.hashCode ^
        charCodes.hashCode ^
        maxColors.hashCode ^
        name.hashCode ^
        thumbnailUrl.hashCode ^
        createdAt.hashCode ^
        isActive.hashCode;
  }
}
