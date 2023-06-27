// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_check_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultCheckCode _$ResultCheckCodeFromJson(Map<String, dynamic> json) =>
    ResultCheckCode(
      status: json['status'] as bool,
      error: json['error'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      access_token: json['access_token'] as String,
    );

Map<String, dynamic> _$ResultCheckCodeToJson(ResultCheckCode instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'id': instance.id,
      'email': instance.email,
      'access_token': instance.access_token,
    };
