import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class Like {
  final String id;
  final String userId;
  final String variationId;
  final DateTime createdAt;

  const Like({
    required this.id,
    required this.userId,
    required this.variationId,
    required this.createdAt,
  });

  Like copyWith({
    String? id,
    String? userId,
    String? variationId,
    DateTime? createdAt,
  }) {
    return Like(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      variationId: variationId ?? this.variationId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'variationId': variationId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Like.fromMap(Map<String, dynamic> map) {
    return Like(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      variationId: map['variationId'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Like.fromJson(String source) => Like.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Like(id: $id, userId: $userId, variationId: $variationId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Like other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.variationId == variationId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        variationId.hashCode ^
        createdAt.hashCode;
  }
}