import 'package:example/src/user/domain/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(int id);

  Future<List<UserEntity>> getAllUsers();
}
