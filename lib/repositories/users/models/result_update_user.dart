import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_update_user.g.dart';

@JsonSerializable()
class ResultUpdateUser extends Equatable {
  const ResultUpdateUser({
    required this.status,
  });

  final bool status;

  factory ResultUpdateUser.fromJson(Map<String, dynamic> json) =>
      _$ResultUpdateUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResultUpdateUserToJson(this);

  @override
  List<Object?> get props => [status];
}
