import 'package:clean_provider/clean_provider.dart';
import 'package:example/src/user/di/user_providers.dart';
import 'package:example/src/user/presentation/user_scene.dart';
import 'package:example/src/user/presentation/user_view_model.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SceneConsumer<UserViewModel>(
      UserScene.new,
      providers: userProviders,
    );
  }
}
