import 'package:example/src/user/domain/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(
    this.id,
    this.name,
    this.username,
    this.email,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      entity.id,
      entity.name,
      entity.username,
      entity.email,
    );
  }

  final int id;
  final String name;
  final String username;
  final String email;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() => UserEntity(
        id,
        name,
        username,
        email,
      );
}
