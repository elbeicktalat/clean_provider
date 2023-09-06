// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:clean_provider/src/interfaces/view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Instance of [ViewModel], this allows developers to use [Scene]s
/// without need to create a concrete [ViewModel].
final class _DefaultViewModel extends ViewModel {}

@optionalTypeArgs
final class SceneConsumer<T extends ViewModel> extends StatelessWidget {
  const SceneConsumer(
    this._sceneBuilder, {
    this.providers,
    super.key,
  });

  final List<SingleChildWidget>? providers;
  final SceneBuilder<T> _sceneBuilder;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers ??
          <SingleChildWidget>[
            ChangeNotifierProvider<ViewModel>(
              create: (_) => _DefaultViewModel(),
            ),
          ],
      builder: (_, __) {
        return Consumer<T>(
          builder: (_, T viewModel, __) => _sceneBuilder(viewModel),
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<SingleChildWidget>('providers', providers));
  }
}
