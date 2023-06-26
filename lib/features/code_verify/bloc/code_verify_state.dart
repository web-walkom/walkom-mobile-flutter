part of 'code_verify_bloc.dart';

abstract class CodeVerifyState extends Equatable {}

class CodeVerifyInitial extends CodeVerifyState {
  @override
  List<Object?> get props => [];
}

class CodeVerifyChecking extends CodeVerifyState {
  @override
  List<Object?> get props => [];
}

class CodeVerifyChecked extends CodeVerifyState {
  @override
  List<Object?> get props => [];
}

class CodeVerifyError extends CodeVerifyState {
  CodeVerifyError({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
