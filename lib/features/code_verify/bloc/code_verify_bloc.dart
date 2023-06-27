import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';

part 'code_verify_event.dart';
part 'code_verify_state.dart';

class CodeVerifyBloc extends Bloc<CodeVerifyEvent, CodeVerifyState> {
  final AuthRepository authRepository;

  CodeVerifyBloc(this.authRepository) : super(CodeVerifyInitial()) {
    on<CheckSecretCode>((event, emit) async {
      try {
        if (state is! CodeVerifyChecked) {
          emit(CodeVerifyChecking());
        }

        final result = await authRepository.checkSecretCode(event.email, event.code);
        emit(CodeVerifyChecked(result: result));
      } catch (e, st) {
        emit(CodeVerifyError(error: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
}
