// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class Template {
  // Unique identifier for the template
  final String fontFamily;

  final String fontFileUrl;
  final double fontSize;
  final List<int> charCodes;
  final int maxColors;

  final String name;
  final String thumbnailUrl;
  final DateTime createdAt;
  final bool isActive;

  final bool isPremium;

  const Template({
    required this.fontFamily,
    required this.fontFileUrl,
    required this.fontSize,
    required this.charCodes,
    required this.maxColors,
    required this.name,
    required this.thumbnailUrl,
    required this.createdAt,
    required this.isActive,
    required this.isPremium,
  });

  Template copyWith({
    String? fontFamily,
    String? fontFileUrl,
    double? fontSize,
    List<int>? charCodes,
    int? maxColors,
    String? name,
    String? thumbnailUrl,
    DateTime? createdAt,
    bool? isActive,
    bool? isPremium,
  }) {
    return Template(
      fontFamily: fontFamily ?? this.fontFamily,
      fontFileUrl: fontFileUrl ?? this.fontFileUrl,
      fontSize: fontSize ?? this.fontSize,
      charCodes: charCodes ?? this.charCodes,
      maxColors: maxColors ?? this.maxColors,
      name: name ?? this.name,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fontFamily': fontFamily,
      'fontFileUrl': fontFileUrl,
      'fontSize': fontSize,
      'charCodes': charCodes,
      'maxColors': maxColors,
      'name': name,
      'thumbnailUrl': thumbnailUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActive': isActive,
      'isPremium': isPremium,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      fontFamily: map['fontFamily'] as String,
      fontFileUrl: map['fontFileUrl'] as String,
      fontSize: (map['fontSize'] ?? 0).toDouble(),
      charCodes:
          (map['charCodes'] as List?)?.map((x) => x as int).toList() ?? [],
      maxColors: map['maxColors'] as int,
      name: map['name'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String? ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isActive: map['isActive'] as bool? ?? false,
      isPremium: map['isPremium'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) =>
      Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Template(fontFamily: $fontFamily, fontFileUrl: $fontFileUrl, fontSize: $fontSize, charCodes: $charCodes, maxColors: $maxColors, name: $name, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, isActive: $isActive, isPremium: $isPremium)';
  }

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.fontFamily == fontFamily &&
        other.fontFileUrl == fontFileUrl &&
        other.fontSize == fontSize &&
        listEquals(other.charCodes, charCodes) &&
        other.maxColors == maxColors &&
        other.name == name &&
        other.thumbnailUrl == thumbnailUrl &&
        other.createdAt == createdAt &&
        other.isActive == isActive &&
        other.isPremium == isPremium;
  }

  @override
  int get hashCode {
    return fontFamily.hashCode ^
        fontFileUrl.hashCode ^
        fontSize.hashCode ^
        charCodes.hashCode ^
        maxColors.hashCode ^
        name.hashCode ^
        thumbnailUrl.hashCode ^
        createdAt.hashCode ^
        isActive.hashCode ^
        isPremium.hashCode;
  }
}
