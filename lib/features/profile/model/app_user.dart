import 'dart:convert';

class AppUser {
  final String id;
  final int contributions;
  final int upvotes;
  final int following;
  final String bio;

  AppUser({
    required this.id,
    required this.contributions,
    required this.upvotes,
    required this.following,
    required this.bio,
  });

  AppUser copyWith({
    String? id,
    int? contributions,
    int? upvotes,
    int? following,
    String? bio,
  }) {
    return AppUser(
      id: id ?? this.id,
      contributions: contributions ?? this.contributions,
      upvotes: upvotes ?? this.upvotes,
      following: following ?? this.following,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contributions': contributions,
      'upvotes': upvotes,
      'following': following,
      'bio': bio,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      contributions: map['contributions']?.toInt() ?? 0,
      upvotes: map['upvotes']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, contributions: $contributions, upvotes: $upvotes, following: $following, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.contributions == contributions &&
        other.upvotes == upvotes &&
        other.following == following &&
        other.bio == bio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        contributions.hashCode ^
        upvotes.hashCode ^
        following.hashCode ^
        bio.hashCode;
  }
}
