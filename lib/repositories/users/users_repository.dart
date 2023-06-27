import 'package:walkom_mobile_flutter/repositories/users/models/models.dart';

abstract class UsersRepository {
  Future<User> getUserById(String id);
  Future<ResultUpdateUser> updateUser(User user);
}
