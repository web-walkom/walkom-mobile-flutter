import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_check_code.g.dart';

@JsonSerializable()
class ResultCheckCode extends Equatable {
  const ResultCheckCode({
    required this.status,
    required this.error,
    required this.id,
    required this.email,
    required this.access_token,
  });

  final bool status;
  final String error;
  final String id;
  final String email;
  final String access_token;

  factory ResultCheckCode.fromJson(Map<String, dynamic> json) =>
      _$ResultCheckCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ResultCheckCodeToJson(this);

  @override
  List<Object?> get props => [status, error, id, email, access_token];
}
