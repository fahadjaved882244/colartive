import 'dart:convert';

class VectorArtWrapper {
  final String id;
  final String scaffoldId;
  final String? skinId;
  VectorArtWrapper({
    required this.id,
    required this.scaffoldId,
    this.skinId,
  });

  VectorArtWrapper copyWith({
    String? id,
    String? scaffoldId,
    String? skinId,
  }) {
    return VectorArtWrapper(
      id: id ?? this.id,
      scaffoldId: scaffoldId ?? this.scaffoldId,
      skinId: skinId ?? this.skinId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'scaffoldId': scaffoldId,
      'skinId': skinId,
    };
  }

  factory VectorArtWrapper.fromMap(Map<String, dynamic> map) {
    return VectorArtWrapper(
      id: map['id'] ?? '',
      scaffoldId: map['scaffoldId'] ?? '',
      skinId: map['skinId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VectorArtWrapper.fromJson(String source) =>
      VectorArtWrapper.fromMap(json.decode(source));

  @override
  String toString() =>
      'VectorArt(id: $id, scaffoldId: $scaffoldId, skinId: $skinId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VectorArtWrapper &&
        other.id == id &&
        other.scaffoldId == scaffoldId &&
        other.skinId == skinId;
  }

  @override
  int get hashCode => id.hashCode ^ scaffoldId.hashCode ^ skinId.hashCode;
}
