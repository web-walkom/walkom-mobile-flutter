part of 'excursion_bloc.dart';

abstract class ExcursionEvent extends Equatable {}

class LoadExcursion extends ExcursionEvent {
  LoadExcursion({
    required this.excursionId,
  });

  final String excursionId;

  @override
  List<Object?> get props => [excursionId];
}
