// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class OverlayText {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final double rotation;
  final double opacity;
  final double posX;
  final double posY;
  const OverlayText({
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.color,
    required this.rotation,
    required this.opacity,
    required this.posX,
    required this.posY,
  });

  OverlayText copyWith({
    String? text,
    double? fontSize,
    String? fontFamily,
    Color? color,
    double? rotation,
    double? opacity,
    double? posX,
    double? posY,
  }) {
    return OverlayText(
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      color: color ?? this.color,
      rotation: rotation ?? this.rotation,
      opacity: opacity ?? this.opacity,
      posX: posX ?? this.posX,
      posY: posY ?? this.posY,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'fontSize': fontSize,
      'fontFamily': fontFamily,
      'color': color.value,
      'rotation': rotation,
      'opacity': opacity,
      'posX': posX,
      'posY': posY,
    };
  }

  factory OverlayText.fromMap(Map<String, dynamic> map) {
    return OverlayText(
      text: map['text'] as String,
      fontSize: map['fontSize'] as double,
      fontFamily: map['fontFamily'] as String,
      color: Color(map['color'] as int),
      rotation: map['rotation'] as double,
      opacity: map['opacity'] as double,
      posX: map['posX'] as double,
      posY: map['posY'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OverlayText.fromJson(String source) =>
      OverlayText.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OverlayText(text: $text, fontSize: $fontSize, fontFamily: $fontFamily, color: $color, rotation: $rotation, opacity: $opacity, posX: $posX, posY: $posY)';
  }

  @override
  bool operator ==(covariant OverlayText other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.fontSize == fontSize &&
        other.fontFamily == fontFamily &&
        other.color == color &&
        other.rotation == rotation &&
        other.opacity == opacity &&
        other.posX == posX &&
        other.posY == posY;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        fontSize.hashCode ^
        fontFamily.hashCode ^
        color.hashCode ^
        rotation.hashCode ^
        opacity.hashCode ^
        posX.hashCode ^
        posY.hashCode;
  }
}
