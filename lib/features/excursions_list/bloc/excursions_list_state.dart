part of 'excursions_list_bloc.dart';

abstract class ExcursionsListState extends Equatable {}

class ExcursionsListInitial extends ExcursionsListState {
  @override
  List<Object?> get props => [];
}

class ExcursionsListLoading extends ExcursionsListState {
  @override
  List<Object?> get props => [];
}

class ExcursionsListLoaded extends ExcursionsListState {
  ExcursionsListLoaded({
    required this.excursionsList,
  });

  final List<ExcursionItem> excursionsList;

  @override
  List<Object?> get props => [excursionsList];
}

class ExcursionsListError extends ExcursionsListState {
  ExcursionsListError({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
