// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      reference: const DocumentReferenceConverter()
          .fromJson(json['reference'] as DocumentReference<Object?>?),
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp?),
      displayName: json['displayName'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fcmToken: json['fcmToken'] as String? ?? '',
      cellPhone: json['cellPhone'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'isActive': instance.isActive,
      'photo': instance.photo,
      'fcmToken': instance.fcmToken,
      'cellPhone': instance.cellPhone,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
