import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class Comment {
  final String id;
  final String variationId;
  final String userId;
  final String userDisplayName;
  final String userProfileImageUrl;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Comment({
    required this.id,
    required this.variationId,
    required this.userId,
    required this.userDisplayName,
    required this.userProfileImageUrl,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  Comment copyWith({
    String? id,
    String? variationId,
    String? userId,
    String? userDisplayName,
    String? userProfileImageUrl,
    String? text,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Comment(
      id: id ?? this.id,
      variationId: variationId ?? this.variationId,
      userId: userId ?? this.userId,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      userProfileImageUrl: userProfileImageUrl ?? this.userProfileImageUrl,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'variationId': variationId,
      'userId': userId,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map, {
    String userDisplayName = '',
    String userProfileImageUrl = '',
  }) {
    return Comment(
      id: map['id'] ?? '',
      variationId: map['variationId'] ?? '',
      userId: map['userId'] ?? '',
      userDisplayName: userDisplayName,
      userProfileImageUrl: userProfileImageUrl,
      text: map['text'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, variationId: $variationId, userId: $userId, userDisplayName: $userDisplayName, userProfileImageUrl: $userProfileImageUrl, text: $text, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.variationId == variationId &&
        other.userId == userId &&
        other.userDisplayName == userDisplayName &&
        other.userProfileImageUrl == userProfileImageUrl &&
        other.text == text &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        variationId.hashCode ^
        userId.hashCode ^
        userDisplayName.hashCode ^
        userProfileImageUrl.hashCode ^
        text.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}