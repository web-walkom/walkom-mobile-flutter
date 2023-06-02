import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions_repository.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'excursions_list_event.dart';
part 'excursions_list_state.dart';

class ExcursionsListBloc
    extends Bloc<ExcursionsListEvent, ExcursionsListState> {
  final ExcursionsRepository excursionsRepository;

  ExcursionsListBloc(this.excursionsRepository)
      : super(ExcursionsListInitial()) {
    on<LoadExcursionsList>((event, emit) async {
      try {
        if (state is! ExcursionsListLoaded) {
          emit(ExcursionsListLoading());
        }

        final excursionsList = await excursionsRepository.getExcursions();
        emit(ExcursionsListLoaded(excursionsList: excursionsList));
      } catch (e, st) {
        emit(ExcursionsListError(error: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
}
