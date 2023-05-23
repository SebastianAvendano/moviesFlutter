// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/data/models/models_converter/date_time_converter.dart';
import 'package:movies/data/models/models_converter/document_reference_converter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.reference,
    this.createdAt,
    this.displayName = '',
    this.photo = '',
    this.email = '',
    this.fcmToken = '',
    this.cellPhone = '',
    this.isActive = false,
  });

  final String? displayName;
  final String? email;
  final bool? isActive;
  final String? photo;
  final String? fcmToken;
  final String? cellPhone;


  @DateTimeConverter()
  final DateTime? createdAt;
  
  @JsonKey(includeToJson: false)
  @DocumentReferenceConverter()
  final DocumentReference? reference;

  UserModel copyWith({
    String? displayName,
    String? email,
    String? photo,
    bool? isActive,
    String? fcmToken,
    String? cellPhone,
    DateTime? createdAt,
    DocumentReference? reference,
    
  }) =>
      UserModel(
        displayName: displayName ?? this.displayName,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        fcmToken: fcmToken ?? this.fcmToken,
        isActive: isActive ?? this.isActive,
        cellPhone: cellPhone ?? this.cellPhone,
        createdAt: createdAt ?? this.createdAt,
        reference: reference ?? this.reference,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
