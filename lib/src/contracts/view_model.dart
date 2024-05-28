// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show experimental, mustCallSuper, protected;

/// The parent of all concrete [ViewModel]s.
///
/// This is where you logic goes.
abstract class ViewModel extends BaseViewModel {
  ViewModel() {
    onInit();
  }

  /// List of [ChangeNotifier], this will hold all your [ValueNotifier]
  /// or any subtype of [ChangeNotifier].
  ///
  /// This allows to save your time by automatically call [notifyListeners].
  @protected
  List<ChangeNotifier> get notifiers => <ChangeNotifier>[];

  /// Invoked on ViewModel creation.
  @experimental
  @protected
  @mustCallSuper
  void onInit() {
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
