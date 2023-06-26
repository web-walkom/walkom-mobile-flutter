part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class AuthByEmail extends AuthEvent {
  AuthByEmail({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}
