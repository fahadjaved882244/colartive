import 'dart:convert';

class AuthUser {
  final String id;
  final String email;
  final String name;
  final bool isVerified;
  final String? phoneNumber;
  final String? photoUrl;
  AuthUser({
    required this.id,
    required this.email,
    required this.name,
    required this.isVerified,
    this.phoneNumber,
    this.photoUrl,
  });

  AuthUser copyWith({
    String? id,
    String? email,
    String? name,
    bool? isVerified,
    String? phoneNumber,
    String? photoUrl,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'isVerified': isVerified,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      isVerified: map['isVerified'] ?? false,
      phoneNumber: map['phoneNumber'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUser.fromJson(String source) =>
      AuthUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, isVerified: $isVerified, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthUser &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.isVerified == isVerified &&
        other.phoneNumber == phoneNumber &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        isVerified.hashCode ^
        phoneNumber.hashCode ^
        photoUrl.hashCode;
  }
}
