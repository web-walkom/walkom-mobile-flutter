import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.photo,
    required this.first_name,
    required this.last_name,
  });

  final String id;
  final String email;
  final String photo;
  final String first_name;
  final String last_name;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, email, photo, first_name, last_name];
}
