import 'dart:convert';

import 'package:flutter/foundation.dart';

class VectorScaffold {
  final String id;
  final String designerId;
  final String name;
  final String fontFilePath;
  final String fontFamilyName;
  final List<int> elements;
  final VectorType type;
  final double scale;
  final String category;
  final List<String> tags;
  final DateTime dateAdded;
  VectorScaffold({
    required this.id,
    required this.designerId,
    required this.name,
    required this.fontFilePath,
    required this.fontFamilyName,
    required this.elements,
    required this.type,
    this.scale = 1,
    required this.category,
    required this.tags,
    required this.dateAdded,
  });

  VectorScaffold copyWith({
    String? id,
    String? designerId,
    String? name,
    String? fontFilePath,
    String? fontFamilyName,
    List<int>? elements,
    VectorType? type,
    double? scale,
    String? category,
    List<String>? tags,
    DateTime? dateAdded,
  }) {
    return VectorScaffold(
      id: id ?? this.id,
      designerId: designerId ?? this.designerId,
      name: name ?? this.name,
      fontFilePath: fontFilePath ?? this.fontFilePath,
      fontFamilyName: fontFamilyName ?? this.fontFamilyName,
      elements: elements ?? this.elements,
      type: type ?? this.type,
      scale: scale ?? this.scale,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'designerId': designerId,
      'name': name,
      'fontFilePath': fontFilePath,
      'fontFamilyName': fontFamilyName,
      'elements': elements,
      'type': type.toMap(),
      'scale': scale,
      'category': category,
      'tags': tags,
      'dateAdded': dateAdded.millisecondsSinceEpoch,
    };
  }

  factory VectorScaffold.fromMap(Map<String, dynamic> map) {
    return VectorScaffold(
      id: map['id'] ?? '',
      designerId: map['designerId'] ?? '',
      name: map['name'] ?? '',
      fontFilePath: map['fontFilePath'] ?? '',
      fontFamilyName: map['fontFamilyName'] ?? '',
      elements: List<int>.from(map['elements']),
      type: VectorType.fromMap(map['type']),
      scale: map['scale']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      tags: List<String>.from(map['tags']),
      dateAdded: DateTime.fromMillisecondsSinceEpoch(map['dateAdded']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VectorScaffold.fromJson(String source) =>
      VectorScaffold.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VectorScaffold(id: $id, designerId: $designerId, name: $name, fontFilePath: $fontFilePath, fontFamilyName: $fontFamilyName, elements: $elements, type: $type, scale: $scale, category: $category, tags: $tags, dateAdded: $dateAdded)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VectorScaffold &&
        other.id == id &&
        other.designerId == designerId &&
        other.name == name &&
        other.fontFilePath == fontFilePath &&
        other.fontFamilyName == fontFamilyName &&
        listEquals(other.elements, elements) &&
        other.type == type &&
        other.scale == scale &&
        other.category == category &&
        listEquals(other.tags, tags) &&
        other.dateAdded == dateAdded;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        designerId.hashCode ^
        name.hashCode ^
        fontFilePath.hashCode ^
        fontFamilyName.hashCode ^
        elements.hashCode ^
        type.hashCode ^
        scale.hashCode ^
        category.hashCode ^
        tags.hashCode ^
        dateAdded.hashCode;
  }
}

enum VectorType {
  mobile,
  desktop,
  hybrid;

  String toMap() => name;

  factory VectorType.fromMap(String name) {
    for (var v in VectorType.values) {
      if (v.name == name) return v;
    }
    throw ArgumentError.value(name, "name", "No enum entry with that value");
  }
}
