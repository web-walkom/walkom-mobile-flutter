part of 'personal_data_bloc.dart';

abstract class PersonalDataEvent extends Equatable {}

class UpdateUser extends PersonalDataEvent {
  UpdateUser({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}
