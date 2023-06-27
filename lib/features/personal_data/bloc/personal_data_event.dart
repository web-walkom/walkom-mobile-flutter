part of 'personal_data_bloc.dart';

abstract class PersonalDataEvent extends Equatable {}

class UpdateUser extends PersonalDataEvent {
  UpdateUser({
    required this.id,
    required this.photo,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String photo;
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [id, photo, firstName, lastName];
}
