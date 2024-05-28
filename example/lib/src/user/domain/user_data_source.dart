// Copyright (c) 2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:example/src/user/domain/user_entity.dart';

abstract class UserDataSource {
  Future<UserEntity> getUser(int id);

  Future<List<UserEntity>> getAllUsers();
}
