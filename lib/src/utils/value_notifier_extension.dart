// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

extension ValueNotifierExtension<T> on T {
  /// Create an instance of the [ValueNotifier] with the current object type.
  ///
  /// ```dart
  /// final ValueNotifier<bool> isLoading = false.listen
  /// // same as
  /// final ValueNotifier<bool> isLoading = ValueNotifier(false);
  /// ```
  ValueNotifier<T> get listen {
    return ValueNotifier<T>(this);
  }
}
