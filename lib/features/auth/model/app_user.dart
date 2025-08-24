import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/string_x.dart';

class AppUser {
  final String id;
  final String email;
  final String? name;
  final String? imageUrl;
  final String? bio;
  final int contributions;
  final int totalUpvotes;
  final int following;
  final int followers;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime lastActiveAt;

  AppUser({
    required this.id,
    required this.email,
    this.name,
    this.imageUrl,
    this.bio,
    this.contributions = 0,
    this.totalUpvotes = 0,
    this.following = 0,
    this.followers = 0,
    this.isVerified = false,
    required this.createdAt,
    required this.lastActiveAt,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
    String? bio,
    int? contributions,
    int? totalUpvotes,
    int? following,
    int? followers,
    DateTime? createdAt,
    DateTime? lastActiveAt,
    bool? isVerified,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
      contributions: contributions ?? this.contributions,
      totalUpvotes: totalUpvotes ?? this.totalUpvotes,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'bio': bio,
      'contributions': contributions,
      'totalUpvotes': totalUpvotes,
      'following': following,
      'followers': followers,
      'isVerified': isVerified,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastActiveAt': Timestamp.fromDate(lastActiveAt),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      imageUrl: (map['imageUrl'] as String?)?.nullIfEmpty,
      bio: map['bio'],
      contributions: map['contributions']?.toInt() ?? 0,
      totalUpvotes: map['totalUpvotes']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      isVerified: map['isVerified'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lastActiveAt: (map['lastActiveAt'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, imageUrl: $imageUrl, bio: $bio, contributions: $contributions, totalUpvotes: $totalUpvotes, following: $following, followers: $followers, isVerified: $isVerified, createdAt: $createdAt, lastActiveAt: $lastActiveAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.bio == bio &&
        other.contributions == contributions &&
        other.totalUpvotes == totalUpvotes &&
        other.following == following &&
        other.followers == followers &&
        other.isVerified == isVerified &&
        other.createdAt == createdAt &&
        other.lastActiveAt == lastActiveAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        bio.hashCode ^
        contributions.hashCode ^
        totalUpvotes.hashCode ^
        following.hashCode ^
        followers.hashCode ^
        isVerified.hashCode ^
        createdAt.hashCode ^
        lastActiveAt.hashCode;
  }
}
