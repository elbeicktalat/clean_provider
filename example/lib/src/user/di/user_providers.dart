import 'package:example/src/user/data/data_source/user_remote_data_source.dart';
import 'package:example/src/user/data/data_source/user_remote_data_source_impl.dart';
import 'package:example/src/user/data/user_repository_impl.dart';
import 'package:example/src/user/domain/user_repository.dart';
import 'package:example/src/user/presentation/user_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> userProviders = <SingleChildWidget>[
  Provider<http.Client>(create: (_) => http.Client()),
  ProxyProvider<http.Client, UserRemoteDataSource>(
    update: (_, http.Client client, __) {
      return UserRemoteDataSourceImpl(client);
    },
  ),
  ProxyProvider<UserRemoteDataSource, UserRepository>(
    update: (_, UserRemoteDataSource userRemoteDataSource, __) {
      return UserRepositoryImpl(userRemoteDataSource);
    },
  ),
  ChangeNotifierProxyProvider<UserRepository, UserViewModel>(
    create: (_) => UserViewModel(),
    update: (_, UserRepository userRepository, UserViewModel? viewModel) {
      return viewModel!..update(userRepository);
    },
  ),
];
