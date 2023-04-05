import 'dart:convert';

class VectorText {
  final String text;
  final String fontFamily;
  final double scale;
  final int color;
  final double rotation;
  final double dx;
  final double dy;
  VectorText({
    required this.text,
    required this.fontFamily,
    required this.scale,
    required this.color,
    required this.rotation,
    required this.dx,
    required this.dy,
  });

  VectorText copyWith({
    String? text,
    String? fontFamily,
    double? scale,
    int? color,
    double? rotation,
    double? dx,
    double? dy,
  }) {
    return VectorText(
      text: text ?? this.text,
      fontFamily: fontFamily ?? this.fontFamily,
      scale: scale ?? this.scale,
      color: color ?? this.color,
      rotation: rotation ?? this.rotation,
      dx: dx ?? this.dx,
      dy: dy ?? this.dy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'fontFamily': fontFamily,
      'scale': scale,
      'color': color,
      'rotation': rotation,
      'dx': dx,
      'dy': dy,
    };
  }

  factory VectorText.fromMap(Map<String, dynamic> map) {
    return VectorText(
      text: map['text'] ?? '',
      fontFamily: map['fontFamily'] ?? '',
      scale: map['scale']?.toDouble() ?? 0.0,
      color: map['color']?.toInt() ?? 0,
      rotation: map['rotation']?.toDouble() ?? 0.0,
      dx: map['dx']?.toDouble() ?? 0.0,
      dy: map['dy']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VectorText.fromJson(String source) =>
      VectorText.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VectorText(text: $text, fontFamily: $fontFamily, scale: $scale, color: $color, rotation: $rotation, dx: $dx, dy: $dy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VectorText &&
        other.text == text &&
        other.fontFamily == fontFamily &&
        other.scale == scale &&
        other.color == color &&
        other.rotation == rotation &&
        other.dx == dx &&
        other.dy == dy;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        fontFamily.hashCode ^
        scale.hashCode ^
        color.hashCode ^
        rotation.hashCode ^
        dx.hashCode ^
        dy.hashCode;
  }
}
