import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions_repository.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'excursions_list_event.dart';
part 'excursions_list_state.dart';

class ExcursionsListBloc
    extends Bloc<ExcursionsListEvent, ExcursionsListState> {
  ExcursionsListBloc(this.excursionsRepository)
      : super(ExcursionsListInitial()) {
    on<LoadExcursionsList>((event, emit) async {
      try {
        if (state is! ExcursionsListLoaded) {
          emit(ExcursionsListLoading());
        }

        final excursionsList = await excursionsRepository.getExcursions();
        emit(ExcursionsListLoaded(excursionsList: excursionsList));
      } catch (e) {
        emit(ExcursionsListError(error: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final ExcursionsRepository excursionsRepository;
}
