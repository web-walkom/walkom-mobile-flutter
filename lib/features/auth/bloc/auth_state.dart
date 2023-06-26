part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSenting extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSented extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  AuthError({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
