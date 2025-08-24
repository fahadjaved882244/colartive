// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class Template {
  // Unique identifier for the template
  final String fontFamily;

  final String fontFileUrl;
  final List<int> charCodes;
  final int maxColors;
  final bool isLargerSize;
  final double sizeRatio;
  final bool useHeightSize;

  final String name;
  final String thumbnailUrl;
  final DateTime createdAt;
  final bool isActive;

  final bool isPremium;

  const Template({
    required this.fontFamily,
    required this.fontFileUrl,
    required this.charCodes,
    required this.maxColors,
    required this.isLargerSize,
    required this.sizeRatio,
    required this.useHeightSize,
    required this.name,
    required this.thumbnailUrl,
    required this.createdAt,
    required this.isActive,
    required this.isPremium,
  });

  Template copyWith({
    String? fontFamily,
    String? fontFileUrl,
    List<int>? charCodes,
    int? maxColors,
    bool? isLargerSize,
    double? sizeRatio,
    bool? useHeightSize,
    String? name,
    String? thumbnailUrl,
    DateTime? createdAt,
    bool? isActive,
    bool? isPremium,
  }) {
    return Template(
      fontFamily: fontFamily ?? this.fontFamily,
      fontFileUrl: fontFileUrl ?? this.fontFileUrl,
      charCodes: charCodes ?? this.charCodes,
      maxColors: maxColors ?? this.maxColors,
      isLargerSize: isLargerSize ?? this.isLargerSize,
      sizeRatio: sizeRatio ?? this.sizeRatio,
      useHeightSize: useHeightSize ?? this.useHeightSize,
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
      'charCodes': charCodes,
      'maxColors': maxColors,
      'isLargerSize': isLargerSize,
      'sizeRatioValue': sizeRatio,
      'useHeightSize': useHeightSize,
      'name': name,
      'thumbnailUrl': thumbnailUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActive': isActive,
      'isPremium': isPremium,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    if ((map['fontFamily'] == null || map['fontFamily'] is! String) ||
        (map['fontFileUrl'] == null || map['fontFileUrl'] is! String) ||
        (map['charCodes'] == null || map['charCodes'] is! List) ||
        (map['maxColors'] == null || map['maxColors'] is! int) ||
        (map['name'] == null || map['name'] is! String) ||
        (map['createdAt'] == null || map['createdAt'] is! Timestamp) ||
        (map['thumbnailUrl'] == null || map['thumbnailUrl'] is! String)) {
      throw Exception('Invalid map data for Template');
    }
    return Template(
      fontFamily: map['fontFamily'] as String,
      fontFileUrl: map['fontFileUrl'] as String,
      charCodes: (map['charCodes'] as List).map((x) => x as int).toList(),
      maxColors: map['maxColors'] as int,
      isLargerSize: map['isLargerSize'] as bool? ?? false,
      sizeRatio: (map['sizeRatioValue'] ?? 1).toDouble(),
      useHeightSize: map['useHeightSize'] as bool? ?? false,
      name: map['name'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
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
    return 'Template(fontFamily: $fontFamily, fontFileUrl: $fontFileUrl, charCodes: $charCodes, maxColors: $maxColors, name: $name, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt, isActive: $isActive, isPremium: $isPremium)';
  }

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.fontFamily == fontFamily &&
        other.fontFileUrl == fontFileUrl &&
        listEquals(other.charCodes, charCodes) &&
        other.maxColors == maxColors &&
        other.isLargerSize == isLargerSize &&
        other.sizeRatio == sizeRatio &&
        other.useHeightSize == useHeightSize &&
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
        charCodes.hashCode ^
        maxColors.hashCode ^
        isLargerSize.hashCode ^
        sizeRatio.hashCode ^
        useHeightSize.hashCode ^
        name.hashCode ^
        thumbnailUrl.hashCode ^
        createdAt.hashCode ^
        isActive.hashCode ^
        isPremium.hashCode;
  }
}
