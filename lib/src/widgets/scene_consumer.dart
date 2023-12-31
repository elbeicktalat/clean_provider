// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:clean_provider/src/contracts/view_model.dart';
import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, IterableProperty;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;
import 'package:meta/meta.dart' show nonVirtual, optionalTypeArgs;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, Consumer, MultiProvider;
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

/// Instance of [ViewModel], this allows developers to use [Scene]s
/// without need to create a concrete [ViewModel].
final class _DefaultViewModel extends ViewModel {}

/// Provide your [Scene] the proper [viewModel].
///
/// This widget receive a type parameter, subtype of [ViewModel]
/// to inject your concrete [ViewModel].
@optionalTypeArgs
final class SceneConsumer<T extends ViewModel> extends StatelessWidget {
  const SceneConsumer(
    this._sceneBuilder, {
    this.providers,
    super.key,
  });

  /// List of providers needed to rebuild your UI.
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
