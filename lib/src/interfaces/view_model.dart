// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:flutter/material.dart';

abstract class ViewModel extends BaseViewModel {
  ViewModel() {
    onStart();
  }

  @protected
  List<ChangeNotifier> get notifiers => <ChangeNotifier>[];

  @protected
  @mustCallSuper
  void onStart() {
    for (final ChangeNotifier notifier in notifiers) {
      notifier.addListener(notifyListeners);
    }
  }

  @override
  @protected
  @mustCallSuper
  void dispose() {
    for (final ChangeNotifier notifier in notifiers) {
      notifier.dispose();
    }
    super.dispose();
  }
}
