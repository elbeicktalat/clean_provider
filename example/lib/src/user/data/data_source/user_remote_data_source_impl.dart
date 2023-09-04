import 'dart:convert';

import 'package:example/src/user/data/data_source/user_remote_data_source.dart';
import 'package:example/src/user/data/models/user_model.dart';
import 'package:example/src/user/domain/user_entity.dart';
import 'package:http/http.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<UserEntity> getUser(int id) {
    // TODO(somebody): implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final Response response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    final List<dynamic> users = jsonDecode(response.body);
    // ignore: always_specify_types
    final List<UserEntity> list = users.map<UserEntity>((json) {
      return UserModel.fromJson(json).toEntity();
    }).toList();
    return list;
  }
}
