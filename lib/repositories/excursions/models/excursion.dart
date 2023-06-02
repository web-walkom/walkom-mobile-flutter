import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'excursion.g.dart';

@JsonSerializable()
class Excursion extends Equatable {
  const Excursion({
    required this.id,
    required this.title,
    required this.photos,
  });

  final String id;
  final String title;
  final List<String> photos;

  factory Excursion.fromJson(Map<String, dynamic> json) =>
      _$ExcursionFromJson(json);

  Map<String, dynamic> toJson() => _$ExcursionToJson(this);

  @override
  List<Object?> get props => [id, title, photos];
}
