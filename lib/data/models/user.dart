import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final AccountStatus accountStatus;
  final String? phoneNumber;
  final String? photoUrl;
  final DateTime dateAdded;
  final DateTime lastUpdated;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
    required this.accountStatus,
    this.phoneNumber,
    this.photoUrl,
    required this.dateAdded,
    required this.lastUpdated,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isVerified,
    AccountStatus? accountStatus,
    String? phoneNumber,
    String? photoUrl,
    DateTime? dateAdded,
    DateTime? lastUpdated,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isVerified: isVerified ?? this.isVerified,
      accountStatus: accountStatus ?? this.accountStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      dateAdded: dateAdded ?? this.dateAdded,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'isVerified': isVerified,
      'accountStatus': accountStatus.toMap(),
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'dateAdded': dateAdded.millisecondsSinceEpoch,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      isVerified: map['isVerified'] ?? false,
      accountStatus: AccountStatus.fromMap(map['accountStatus']),
      phoneNumber: map['phoneNumber'],
      photoUrl: map['photoUrl'],
      dateAdded: map['dateAdded'] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(map['dateAdded']),
      lastUpdated: map['lastUpdated'] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, isVerified: $isVerified, accountStatus: $accountStatus, phoneNumber: $phoneNumber, photoUrl: $photoUrl, dateAdded: $dateAdded, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.isVerified == isVerified &&
        other.accountStatus == accountStatus &&
        other.phoneNumber == phoneNumber &&
        other.photoUrl == photoUrl &&
        other.dateAdded == dateAdded &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        isVerified.hashCode ^
        accountStatus.hashCode ^
        phoneNumber.hashCode ^
        photoUrl.hashCode ^
        dateAdded.hashCode ^
        lastUpdated.hashCode;
  }
}

enum AccountStatus {
  active("active"),
  deleted("deleted"),
  suspended("suspended");

  final String value;
  const AccountStatus(this.value);

  String toMap() => value;

  factory AccountStatus.fromMap(String name) {
    for (var v in AccountStatus.values) {
      if (v.value == name) return v;
    }
    throw ArgumentError.value(name, "name", "No enum entry with that value");
  }
}
