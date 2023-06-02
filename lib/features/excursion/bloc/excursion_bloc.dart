import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions_repository.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'excursions_event.dart';
part 'excursions_state.dart';

class ExcursionBloc extends Bloc<ExcursionEvent, ExcursionState> {
  final ExcursionsRepository excursionsRepository;

  ExcursionBloc(this.excursionsRepository) : super(ExcursionInitial()) {
    on<LoadExcursion>((event, emit) async {
      try {
        if (state is! ExcursionLoaded) {
          emit(ExcursionLoading());
        }

        final excursion =
            await excursionsRepository.getExcursionById(event.excursionId);
        emit(ExcursionLoaded(excursion: excursion));
      } catch (e, st) {
        emit(ExcursionError(error: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
}
