import 'package:flutter/material.dart';

extension ValueNotifierExtension<T> on T {
  ValueNotifier<T> get listen {
    return ValueNotifier<T>(this);
  }
}
