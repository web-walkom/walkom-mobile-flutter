part of 'personal_data_bloc.dart';

abstract class PersonalDataState extends Equatable {}

class PersonalDataInitial extends PersonalDataState {
  @override
  List<Object?> get props => [];
}

class PersonalDataUpdating extends PersonalDataState {
  @override
  List<Object?> get props => [];
}

class PersonalDataUpdated extends PersonalDataState {
  PersonalDataUpdated({
    required this.result,
  });

  final ResultUpdateUser result;

  @override
  List<Object?> get props => [result];
}

class PersonalDataError extends PersonalDataState {
  PersonalDataError({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
