// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'package:colartive2/features/canvas_live/model/overlay_text.dart';

@immutable
class Variation {
  final List<Color> colors;
  final double scaleFactor;
  final double rotationFactor;
  final double blurFactor;
  final List<OverlayText> overlayTexts;
  const Variation({
    required this.colors,
    required this.scaleFactor,
    required this.rotationFactor,
    required this.blurFactor,
    required this.overlayTexts,
  });

  //create a constructore for empty variation
  const Variation.empty()
      : colors = const [],
        scaleFactor = 1.0,
        rotationFactor = 0.0,
        blurFactor = 0.0,
        overlayTexts = const [];

  Variation copyWith({
    List<Color>? colors,
    double? scaleFactor,
    double? rotationFactor,
    double? blurFactor,
    List<OverlayText>? overlayTexts,
  }) {
    return Variation(
      colors: colors ?? this.colors,
      scaleFactor: scaleFactor ?? this.scaleFactor,
      rotationFactor: rotationFactor ?? this.rotationFactor,
      blurFactor: blurFactor ?? this.blurFactor,
      overlayTexts: overlayTexts ?? this.overlayTexts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'colors': colors.map((x) => x.toARGB32()).toList(),
      'scaleFactor': scaleFactor,
      'rotationFactor': rotationFactor,
      'blurFactor': blurFactor,
      'overlayTexts': overlayTexts.map((x) => x.toMap()).toList(),
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    return Variation(
      colors: List<Color>.from(
        (map['colors'] as List<int>).map<Color>(
          (x) => Color(x),
        ),
      ),
      scaleFactor: map['scaleFactor'] as double,
      rotationFactor: map['rotationFactor'] as double,
      blurFactor: map['blurFactor'] as double,
      overlayTexts: List<OverlayText>.from(
        (map['overlayTexts']).map(
          (x) => OverlayText.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Variation.fromJson(String source) =>
      Variation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Variation(colors: $colors, scaleFactor: $scaleFactor, rotationFactor: $rotationFactor, blurFactor: $blurFactor, overlayTexts: $overlayTexts)';
  }

  @override
  bool operator ==(covariant Variation other) {
    if (identical(this, other)) return true;

    return listEquals(other.colors, colors) &&
        other.scaleFactor == scaleFactor &&
        other.rotationFactor == rotationFactor &&
        other.blurFactor == blurFactor &&
        listEquals(other.overlayTexts, overlayTexts);
  }

  @override
  int get hashCode {
    return colors.hashCode ^
        scaleFactor.hashCode ^
        rotationFactor.hashCode ^
        blurFactor.hashCode ^
        overlayTexts.hashCode;
  }
}
