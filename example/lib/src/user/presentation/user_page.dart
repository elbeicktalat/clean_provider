// Copyright (c) 2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:example/src/user/di/user_providers.dart';
import 'package:example/src/user/presentation/user_scene.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: userProviders,
      child: UserScene(),
    );
  }
}
