import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final UsersRepository authRepository;

  PersonalDataBloc(this.authRepository) : super(PersonalDataInitial()) {
    on<UpdateUser>((event, emit) async {
      try {
        if (state is! PersonalDataUpdated) {
          emit(PersonalDataUpdating());
        }

        final result = await authRepository.updateUser(event.user);
        emit(PersonalDataUpdated(result: result));
      } catch (e, st) {
        emit(PersonalDataError(error: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
}
