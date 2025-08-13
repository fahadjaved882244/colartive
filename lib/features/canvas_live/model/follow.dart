import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class Follow {
  final String id;
  final String followerId;
  final String followingId;
  final DateTime createdAt;

  const Follow({
    required this.id,
    required this.followerId,
    required this.followingId,
    required this.createdAt,
  });

  Follow copyWith({
    String? id,
    String? followerId,
    String? followingId,
    DateTime? createdAt,
  }) {
    return Follow(
      id: id ?? this.id,
      followerId: followerId ?? this.followerId,
      followingId: followingId ?? this.followingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'followerId': followerId,
      'followingId': followingId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Follow.fromMap(Map<String, dynamic> map) {
    return Follow(
      id: map['id'] ?? '',
      followerId: map['followerId'] ?? '',
      followingId: map['followingId'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Follow.fromJson(String source) => Follow.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Follow(id: $id, followerId: $followerId, followingId: $followingId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Follow other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.followerId == followerId &&
        other.followingId == followingId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        followerId.hashCode ^
        followingId.hashCode ^
        createdAt.hashCode;
  }
}