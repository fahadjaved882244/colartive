import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/features/canvas/model/variation.dart';
import 'package:flutter/foundation.dart';

@immutable
class SharedVariation {
  final String id;
  final String templateId;
  final String userId;
  final Variation variation;
  final String? description;
  final int upvoteCount;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPublic;

  const SharedVariation({
    required this.id,
    required this.templateId,
    required this.userId,
    required this.variation,
    required this.description,
    required this.upvoteCount,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.isPublic,
  });

  SharedVariation copyWith({
    String? id,
    String? templateId,
    String? userId,
    Variation? variation,
    String? description,
    int? upvoteCount,
    int? commentCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPublic,
  }) {
    return SharedVariation(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      userId: userId ?? this.userId,
      variation: variation ?? this.variation,
      description: description ?? this.description,
      upvoteCount: upvoteCount ?? this.upvoteCount,
      commentCount: commentCount ?? this.commentCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPublic: isPublic ?? this.isPublic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'templateId': templateId,
      'userId': userId,
      'variation': variation.toMap(),
      'description': description,
      'upvoteCount': upvoteCount,
      'commentCount': commentCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'isPublic': isPublic,
    };
  }

  factory SharedVariation.fromMap(Map<String, dynamic> map) {
    if ((map['id'] == null || map['id'] is! String) ||
        (map['templateId'] == null || map['templateId'] is! String) ||
        (map['userId'] == null || map['userId'] is! String) ||
        (map['variation'] == null ||
            map['variation'] is! Map<String, dynamic>)) {
      throw Exception('Invalid map data for SharedVariation');
    }
    return SharedVariation(
      id: map['id'],
      templateId: map['templateId'],
      userId: map['userId'],
      variation: Variation.fromMap(map['variation'] as Map<String, dynamic>),
      description: map['description'],
      upvoteCount: map['upvoteCount'] ?? 0,
      commentCount: map['commentCount'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
      isPublic: map['isPublic'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory SharedVariation.fromJson(String source) =>
      SharedVariation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SharedVariation(id: $id, templateId: $templateId, userId: $userId, variation: $variation, description: $description, upvoteCount: $upvoteCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt, isPublic: $isPublic)';
  }

  @override
  bool operator ==(covariant SharedVariation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.templateId == templateId &&
        other.userId == userId &&
        other.variation == variation &&
        other.description == description &&
        other.upvoteCount == upvoteCount &&
        other.commentCount == commentCount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isPublic == isPublic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        templateId.hashCode ^
        userId.hashCode ^
        variation.hashCode ^
        description.hashCode ^
        upvoteCount.hashCode ^
        commentCount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isPublic.hashCode;
  }
}
