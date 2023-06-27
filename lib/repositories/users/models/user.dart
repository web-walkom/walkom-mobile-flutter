import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.accessToken,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String photo;

  @HiveField(3)
  @JsonKey(name: FIELD_FIRST_NAME)
  final String firstName;

  @HiveField(4)
  @JsonKey(name: FIELD_LAST_NAME)
  final String lastName;

  @HiveField(5)
  @JsonKey(name: FIELD_ACCESS_TOKEN)
  final String accessToken;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, email, photo, firstName, lastName];
}
