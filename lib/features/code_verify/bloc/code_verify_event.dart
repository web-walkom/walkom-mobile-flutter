part of 'code_verify_bloc.dart';

abstract class CodeVerifyEvent extends Equatable {}

class CheckSecretCode extends CodeVerifyEvent {
  CheckSecretCode({
    required this.email,
    required this.code,
  });

  final String email;
  final int code;

  @override
  List<Object?> get props => [email, code];
}
