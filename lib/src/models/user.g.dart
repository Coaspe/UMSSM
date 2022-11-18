// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SUser _$SUserFromJson(Map<String, dynamic> json) => SUser(
      name: json['name'] as String,
      email: json['email'] as String,
      userId: json['userId'] as String,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']) ??
              AccountType.email,
      password: json['password'] as String?,
      profileImg: json['profileImg'] as String?,
    );

Map<String, dynamic> _$SUserToJson(SUser instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'userId': instance.userId,
      'password': instance.password,
      'profileImg': instance.profileImg,
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
    };

const _$AccountTypeEnumMap = {
  AccountType.email: 'email',
  AccountType.google: 'google',
  AccountType.kakao: 'kakao',
};
