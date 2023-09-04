import 'package:clean_provider/clean_provider.dart';
import 'package:example/src/user/domain/user_entity.dart';
import 'package:example/src/user/domain/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ViewModel {
  UserRepository get userRepository => _userRepository;
  late UserRepository _userRepository;

  bool get isLoading => _isLoading.value;
  final ValueNotifier<bool> _isLoading = false.listen;

  final List<UserEntity> users = <UserEntity>[];

  void update(UserRepository userRepository) {
    _userRepository = userRepository;
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    _isLoading.value = true;
    final List<UserEntity> allUsers = await userRepository.getAllUsers();
    users.addAll(allUsers);
    _isLoading.value = false;
  }

  @override
  List<ChangeNotifier> get notifiers => <ChangeNotifier>[
        _isLoading,
      ];
}
