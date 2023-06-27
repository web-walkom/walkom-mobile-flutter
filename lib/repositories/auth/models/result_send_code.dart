import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_send_code.g.dart';

@JsonSerializable()
class ResultSendCode extends Equatable {
  const ResultSendCode({
    required this.status,
    required this.error,
  });

  final bool status;
  final String error;

  factory ResultSendCode.fromJson(Map<String, dynamic> json) =>
      _$ResultSendCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ResultSendCodeToJson(this);

  @override
  List<Object?> get props => [status, error];
}
