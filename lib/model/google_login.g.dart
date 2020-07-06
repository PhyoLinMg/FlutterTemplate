// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLogin _$GoogleLoginFromJson(Map<String, dynamic> json) {
  return GoogleLogin(
    json['google_token'] as String,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$GoogleLoginToJson(GoogleLogin instance) =>
    <String, dynamic>{
      'google_token': instance.googleToken,
      'name': instance.name,
      'image': instance.image,
    };
