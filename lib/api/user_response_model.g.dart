// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return ResponseModel(
    detail: json['detail'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'username': instance.username,
      'password': instance.password,
    };

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) {
  return TokenResponseModel(
    tokenRefresh: json['refresh'] as String?,
    accessToken: json['access'] as String?,
  )
    ..detail = json['detail'] as String?
    ..username = json['username'] as String?
    ..password = json['password'] as String?;
}

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'username': instance.username,
      'password': instance.password,
      'refresh': instance.tokenRefresh,
      'access': instance.accessToken,
    };
