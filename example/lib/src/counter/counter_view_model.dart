// Copyright (c) 2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/clean_provider.dart';
import 'package:flutter/material.dart';

class CounterViewModel extends ViewModel {
  int get counter => _counter.value;
  final ValueNotifier<int> _counter = 0.listen;

  void increment() => _counter.value++;

  void decrement() => _counter.value--;

  @override
  List<ChangeNotifier> get notifiers => <ChangeNotifier>[
        _counter,
      ];

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}
