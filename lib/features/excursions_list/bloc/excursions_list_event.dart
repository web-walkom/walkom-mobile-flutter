part of 'excursions_list_bloc.dart';

abstract class ExcursionsListEvent extends Equatable {}

class LoadExcursionsList extends ExcursionsListEvent {
  LoadExcursionsList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
