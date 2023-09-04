import 'package:example/src/user/data/data_source/user_remote_data_source.dart';
import 'package:example/src/user/domain/user_entity.dart';
import 'package:example/src/user/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._userRemoteDataSource);

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<UserEntity> getUser(int id) {
    return _userRemoteDataSource.getUser(id);
  }

  @override
  Future<List<UserEntity>> getAllUsers() {
    return _userRemoteDataSource.getAllUsers();
  }
}
