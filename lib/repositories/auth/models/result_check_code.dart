import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';

part 'result_check_code.g.dart';

@JsonSerializable()
class ResultCheckCode extends Equatable {
  const ResultCheckCode({
    required this.status,
    required this.error,
    required this.user,
  });

  final bool status;
  final String error;
  final User user;

  factory ResultCheckCode.fromJson(Map<String, dynamic> json) =>
      _$ResultCheckCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ResultCheckCodeToJson(this);

  @override
  List<Object?> get props => [status, error, user];
}
