// ignore_for_file: public_member_api_docs, sort_constructors_first
// models/user_model.dart
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String? phone;
  final DateTime? createdAt;
  final String userid;
  UserModel({
    required this.name,
    this.phone,
    this.createdAt,
    required this.userid,
  });

  UserModel copyWith({
    String? name,
    String? phone,
    DateTime? createdAt,
    String? userid,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      userid: userid ?? this.userid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'userid': userid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      userid: map['userid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, phone: $phone, createdAt: $createdAt, userid: $userid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.createdAt == createdAt &&
        other.userid == userid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        createdAt.hashCode ^
        userid.hashCode;
  }
}
