import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:colartive2/features/canvas_live/model/variation.dart';

@immutable
class SharedVariation {
  final String id;
  final String templateId;
  final String userId;
  final String userDisplayName;
  final String userProfileImageUrl;
  final Variation variation;
  final String title;
  final String description;
  final int upvoteCount;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPublic;
  final bool isLikedByCurrentUser;

  const SharedVariation({
    required this.id,
    required this.templateId,
    required this.userId,
    required this.userDisplayName,
    required this.userProfileImageUrl,
    required this.variation,
    required this.title,
    required this.description,
    required this.upvoteCount,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.isPublic,
    this.isLikedByCurrentUser = false,
  });

  SharedVariation copyWith({
    String? id,
    String? templateId,
    String? userId,
    String? userDisplayName,
    String? userProfileImageUrl,
    Variation? variation,
    String? title,
    String? description,
    int? upvoteCount,
    int? commentCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPublic,
    bool? isLikedByCurrentUser,
  }) {
    return SharedVariation(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      userId: userId ?? this.userId,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      userProfileImageUrl: userProfileImageUrl ?? this.userProfileImageUrl,
      variation: variation ?? this.variation,
      title: title ?? this.title,
      description: description ?? this.description,
      upvoteCount: upvoteCount ?? this.upvoteCount,
      commentCount: commentCount ?? this.commentCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPublic: isPublic ?? this.isPublic,
      isLikedByCurrentUser: isLikedByCurrentUser ?? this.isLikedByCurrentUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'templateId': templateId,
      'userId': userId,
      'variation': variation.toMap(),
      'title': title,
      'description': description,
      'upvoteCount': upvoteCount,
      'commentCount': commentCount,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'isPublic': isPublic,
    };
  }

  factory SharedVariation.fromMap(
    Map<String, dynamic> map, {
    String userDisplayName = '',
    String userProfileImageUrl = '',
    bool isLikedByCurrentUser = false,
  }) {
    return SharedVariation(
      id: map['id'] ?? '',
      templateId: map['templateId'] ?? '',
      userId: map['userId'] ?? '',
      userDisplayName: userDisplayName,
      userProfileImageUrl: userProfileImageUrl,
      variation: Variation.fromMap(map['variation'] ?? {}),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      upvoteCount: map['upvoteCount']?.toInt() ?? 0,
      commentCount: map['commentCount']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] ?? 0),
      isPublic: map['isPublic'] ?? true,
      isLikedByCurrentUser: isLikedByCurrentUser,
    );
  }

  String toJson() => json.encode(toMap());

  factory SharedVariation.fromJson(String source) =>
      SharedVariation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SharedVariation(id: $id, templateId: $templateId, userId: $userId, userDisplayName: $userDisplayName, userProfileImageUrl: $userProfileImageUrl, variation: $variation, title: $title, description: $description, upvoteCount: $upvoteCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt, isPublic: $isPublic, isLikedByCurrentUser: $isLikedByCurrentUser)';
  }

  @override
  bool operator ==(covariant SharedVariation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.templateId == templateId &&
        other.userId == userId &&
        other.userDisplayName == userDisplayName &&
        other.userProfileImageUrl == userProfileImageUrl &&
        other.variation == variation &&
        other.title == title &&
        other.description == description &&
        other.upvoteCount == upvoteCount &&
        other.commentCount == commentCount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isPublic == isPublic &&
        other.isLikedByCurrentUser == isLikedByCurrentUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        templateId.hashCode ^
        userId.hashCode ^
        userDisplayName.hashCode ^
        userProfileImageUrl.hashCode ^
        variation.hashCode ^
        title.hashCode ^
        description.hashCode ^
        upvoteCount.hashCode ^
        commentCount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isPublic.hashCode ^
        isLikedByCurrentUser.hashCode;
  }
}
