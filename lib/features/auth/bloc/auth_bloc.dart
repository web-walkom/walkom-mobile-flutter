import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthByEmail>((event, emit) async {
      try {
        if (state is! AuthSented) {
          emit(AuthSenting());
        }

        final result = await authRepository.sendCodeEmail(event.email);
        emit(AuthSented(result: result));
      } catch (e, st) {
        emit(AuthError(error: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
}
