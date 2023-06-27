import 'package:walkom_mobile_flutter/repositories/auth/models/models.dart';

abstract class AuthRepository {
  Future<ResultSendCode> sendCodeEmail(String email);
  Future<ResultCheckCode> checkSecretCode(String email, int code);
}
