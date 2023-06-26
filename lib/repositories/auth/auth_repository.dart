abstract class AuthRepository {
  Future<void> sendCodeEmail(String email);
  Future<bool> checkSecretCode(String email, int code);
}
