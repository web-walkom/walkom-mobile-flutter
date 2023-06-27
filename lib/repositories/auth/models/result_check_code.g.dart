// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_check_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultCheckCode _$ResultCheckCodeFromJson(Map<String, dynamic> json) =>
    ResultCheckCode(
      status: json['status'] as bool,
      error: json['error'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultCheckCodeToJson(ResultCheckCode instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'user': instance.user,
    };
