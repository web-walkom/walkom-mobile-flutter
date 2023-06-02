part of 'excursion_bloc.dart';

abstract class ExcursionState extends Equatable {}

class ExcursionInitial extends ExcursionState {
  @override
  List<Object?> get props => [];
}

class ExcursionLoading extends ExcursionState {
  @override
  List<Object?> get props => [];
}

class ExcursionLoaded extends ExcursionState {
  ExcursionLoaded({
    required this.excursion,
  });

  final ExcursionDetail excursion;

  @override
  List<Object?> get props => [excursion];
}

class ExcursionError extends ExcursionState {
  ExcursionError({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
