import 'dart:convert';

class AppUser {
  final String id;
  final String email;
  final String name;
  final bool isVerified;
  final UserRole role;
  final String? phoneNumber;
  final String? photoUrl;
  final String? bio;
  final int contributions;
  final int upvotes;
  final int followers;
  final String? dribble;
  final String? behance;
  final String? upwork;
  const AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.isVerified,
    this.role = UserRole.contributor,
    this.phoneNumber,
    this.photoUrl,
    this.bio,
    this.contributions = 0,
    this.upvotes = 0,
    this.followers = 0,
    this.dribble,
    this.behance,
    this.upwork,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    bool? isVerified,
    UserRole? role,
    String? phoneNumber,
    String? photoUrl,
    String? bio,
    int? contributions,
    int? upvotes,
    int? followers,
    String? dribble,
    String? behance,
    String? upwork,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      contributions: contributions ?? this.contributions,
      upvotes: upvotes ?? this.upvotes,
      followers: followers ?? this.followers,
      dribble: dribble ?? this.dribble,
      behance: behance ?? this.behance,
      upwork: upwork ?? this.upwork,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'isVerified': isVerified,
      'role': role.toMap(),
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'bio': bio,
      'contributions': contributions,
      'upvotes': upvotes,
      'followers': followers,
      'dribble': dribble,
      'behance': behance,
      'upwork': upwork,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      isVerified: map['isVerified'] ?? false,
      role: UserRole.fromMap(map['role']),
      phoneNumber: map['phoneNumber'],
      photoUrl: map['photoUrl'],
      bio: map['bio'],
      contributions: map['contributions']?.toInt() ?? 0,
      upvotes: map['upvotes']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      dribble: map['dribble'],
      behance: map['behance'],
      upwork: map['upwork'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, name: $name, isVerified: $isVerified, role: $role, phoneNumber: $phoneNumber, photoUrl: $photoUrl, bio: $bio, contributions: $contributions, upvotes: $upvotes, followers: $followers, dribble: $dribble, behance: $behance, upwork: $upwork)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.isVerified == isVerified &&
        other.role == role &&
        other.phoneNumber == phoneNumber &&
        other.photoUrl == photoUrl &&
        other.bio == bio &&
        other.contributions == contributions &&
        other.upvotes == upvotes &&
        other.followers == followers &&
        other.dribble == dribble &&
        other.behance == behance &&
        other.upwork == upwork;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        isVerified.hashCode ^
        role.hashCode ^
        phoneNumber.hashCode ^
        photoUrl.hashCode ^
        bio.hashCode ^
        contributions.hashCode ^
        upvotes.hashCode ^
        followers.hashCode ^
        dribble.hashCode ^
        behance.hashCode ^
        upwork.hashCode;
  }
}

enum UserRole {
  admin,
  artist,
  contributor;

  String toMap() => name;

  factory UserRole.fromMap(String name) {
    for (var v in UserRole.values) {
      if (v.name == name) return v;
    }
    throw ArgumentError.value(name, "name", "No enum entry with that value");
  }
}
