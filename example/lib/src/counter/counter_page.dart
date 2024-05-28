// Copyright (c) 2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:example/src/counter/counter_scene.dart';
import 'package:example/src/counter/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  static List<SingleChildWidget> get providers => <SingleChildWidget>[
    ChangeNotifierProvider<CounterViewModel>(
      create: (_) => CounterViewModel(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: CounterView(
        title: 'Clean Provider Counter',
      ),
    );
  }
}
