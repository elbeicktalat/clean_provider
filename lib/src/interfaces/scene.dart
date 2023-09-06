// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/clean_provider.dart';
import 'package:clean_provider/src/_internal/internal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;

@optionalTypeArgs
abstract class Scene<T extends ViewModel> extends StatelessWidget
    with BaseSceneMixin<T> {
  const Scene(
    this.viewModel, {
    super.key,
  });

  @override
  @protected
  @nonVirtual
  final T viewModel;

  @override
  @protected
  @nonVirtual
  Widget build(BuildContext context) => super.build(context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('viewModel', viewModel));
  }
}
