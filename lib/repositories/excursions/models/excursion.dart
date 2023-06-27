import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'excursion.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Excursion extends Equatable {
  const Excursion({
    required this.id,
    required this.title,
    required this.photos,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final List<String> photos;

  factory Excursion.fromJson(Map<String, dynamic> json) =>
      _$ExcursionFromJson(json);

  Map<String, dynamic> toJson() => _$ExcursionToJson(this);

  @override
  List<Object?> get props => [id, title, photos];
}
