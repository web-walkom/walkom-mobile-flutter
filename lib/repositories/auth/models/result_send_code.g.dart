// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_send_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultSendCode _$ResultSendCodeFromJson(Map<String, dynamic> json) =>
    ResultSendCode(
      status: json['status'] as bool,
      error: json['error'] as String,
    );

Map<String, dynamic> _$ResultSendCodeToJson(ResultSendCode instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
    };
