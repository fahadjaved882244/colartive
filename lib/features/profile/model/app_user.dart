import 'dart:convert';

class AppUser {
  final String id;
  final String? displayName;
  final String email;
  final String? profileImageUrl;
  final String? bio;
  final int contributions;
  final int totalUpvotes;
  final int following;
  final int followers;
  final DateTime createdAt;
  final DateTime lastActiveAt;

  AppUser({
    required this.id,
    required this.displayName,
    required this.email,
    this.profileImageUrl,
    this.bio,
    required this.contributions,
    required this.totalUpvotes,
    required this.following,
    required this.followers,
    required this.createdAt,
    required this.lastActiveAt,
  });

  AppUser copyWith({
    String? id,
    String? displayName,
    String? email,
    String? profileImageUrl,
    String? bio,
    int? contributions,
    int? totalUpvotes,
    int? following,
    int? followers,
    DateTime? createdAt,
    DateTime? lastActiveAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      bio: bio ?? this.bio,
      contributions: contributions ?? this.contributions,
      totalUpvotes: totalUpvotes ?? this.totalUpvotes,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'contributions': contributions,
      'totalUpvotes': totalUpvotes,
      'following': following,
      'followers': followers,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'lastActiveAt': lastActiveAt.millisecondsSinceEpoch,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      bio: map['bio'] ?? '',
      contributions: map['contributions']?.toInt() ?? 0,
      totalUpvotes: map['totalUpvotes']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      lastActiveAt:
          DateTime.fromMillisecondsSinceEpoch(map['lastActiveAt'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, displayName: $displayName, email: $email, profileImageUrl: $profileImageUrl, bio: $bio, contributions: $contributions, totalUpvotes: $totalUpvotes, following: $following, followers: $followers, createdAt: $createdAt, lastActiveAt: $lastActiveAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.displayName == displayName &&
        other.email == email &&
        other.profileImageUrl == profileImageUrl &&
        other.bio == bio &&
        other.contributions == contributions &&
        other.totalUpvotes == totalUpvotes &&
        other.following == following &&
        other.followers == followers &&
        other.createdAt == createdAt &&
        other.lastActiveAt == lastActiveAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        profileImageUrl.hashCode ^
        bio.hashCode ^
        contributions.hashCode ^
        totalUpvotes.hashCode ^
        following.hashCode ^
        followers.hashCode ^
        createdAt.hashCode ^
        lastActiveAt.hashCode;
  }
}
