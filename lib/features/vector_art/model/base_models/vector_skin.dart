import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'vector_text.dart';

class VectorSkin {
  final String id;
  final String contributorId;
  final List<int> colorPalette;
  final List<VectorText> textPalette;
  final double scale;
  final double blur;
  final double rotation;
  VectorSkin({
    required this.id,
    required this.contributorId,
    required this.colorPalette,
    this.textPalette = const [],
    this.scale = 1,
    this.blur = 0,
    this.rotation = 0,
  });

  VectorSkin copyWith({
    String? id,
    String? contributorId,
    List<int>? colorPalette,
    List<VectorText>? textPalette,
    double? scale,
    double? blur,
    double? rotation,
  }) {
    return VectorSkin(
      id: id ?? this.id,
      contributorId: contributorId ?? this.contributorId,
      colorPalette: colorPalette ?? this.colorPalette,
      textPalette: textPalette ?? this.textPalette,
      scale: scale ?? this.scale,
      blur: blur ?? this.blur,
      rotation: rotation ?? this.rotation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contributorId': contributorId,
      'colorPalette': colorPalette,
      'textPalette': textPalette.map((x) => x.toMap()).toList(),
      'scale': scale,
      'blur': blur,
      'rotation': rotation,
    };
  }

  factory VectorSkin.fromMap(Map<String, dynamic> map) {
    return VectorSkin(
      id: map['id'] ?? '',
      contributorId: map['contributorId'] ?? '',
      colorPalette: List<int>.from(map['colorPalette']),
      textPalette: List<VectorText>.from(
          map['textPalette']?.map((x) => VectorText.fromMap(x))),
      scale: map['scale']?.toDouble() ?? 0.0,
      blur: map['blur']?.toDouble() ?? 0.0,
      rotation: map['rotation']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VectorSkin.fromJson(String source) =>
      VectorSkin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VectorSkin(id: $id, contributorId: $contributorId, colorPalette: $colorPalette, textPalette: $textPalette, scale: $scale, blur: $blur, rotation: $rotation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VectorSkin &&
        other.id == id &&
        other.contributorId == contributorId &&
        listEquals(other.colorPalette, colorPalette) &&
        listEquals(other.textPalette, textPalette) &&
        other.scale == scale &&
        other.blur == blur &&
        other.rotation == rotation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        contributorId.hashCode ^
        colorPalette.hashCode ^
        textPalette.hashCode ^
        scale.hashCode ^
        blur.hashCode ^
        rotation.hashCode;
  }
}
