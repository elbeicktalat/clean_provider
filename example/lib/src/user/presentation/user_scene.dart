import 'package:clean_provider/clean_provider.dart';
import 'package:example/src/user/domain/user_entity.dart';
import 'package:example/src/user/presentation/user_view_model.dart';
import 'package:flutter/material.dart';

class UserScene extends Scene<UserViewModel> {
  const UserScene(super.viewModel, {super.key});

  @override
  Widget? builder() {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Users'),
          ),
          body: ListView.builder(
            itemCount: viewModel.users.length,
            itemBuilder: (BuildContext context, int index) {
              final UserEntity user = viewModel.users[index];
              return ListTile(
                onTap: () {},
                leading: Text(user.id.toString()),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(user.name),
                    Text(user.email),
                  ],
                ),
              );
            },
          ),
        ),
        if (viewModel.isLoading)
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.grey.withOpacity(.7),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
