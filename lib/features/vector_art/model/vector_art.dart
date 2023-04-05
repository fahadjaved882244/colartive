import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'base_models/vector_scaffold.dart';
import 'base_models/vector_skin.dart';

class VectorArt {
  final VectorScaffold scaffold;
  final List<VectorSkin> skins;
  VectorArt({
    required this.scaffold,
    required this.skins,
  });

  VectorArt copyWith({
    VectorScaffold? scaffold,
    List<VectorSkin>? skins,
  }) {
    return VectorArt(
      scaffold: scaffold ?? this.scaffold,
      skins: skins ?? this.skins,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scaffold': scaffold.toMap(),
      'skins': skins.map((x) => x.toMap()).toList(),
    };
  }

  factory VectorArt.fromMap(Map<String, dynamic> map) {
    return VectorArt(
      scaffold: VectorScaffold.fromMap(map['scaffold']),
      skins: List<VectorSkin>.from(
          map['skins']?.map((x) => VectorSkin.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VectorArt.fromJson(String source) =>
      VectorArt.fromMap(json.decode(source));

  @override
  String toString() => 'VectorArt(scaffold: $scaffold, skins: $skins)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VectorArt &&
        other.scaffold == scaffold &&
        listEquals(other.skins, skins);
  }

  @override
  int get hashCode => scaffold.hashCode ^ skins.hashCode;
}
