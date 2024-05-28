// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:clean_provider/src/contracts/view.dart';
import 'package:clean_provider/src/contracts/view_model.dart';
import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, DiagnosticsProperty;
import 'package:flutter/material.dart' show StatelessWidget;
import 'package:meta/meta.dart' show immutable, optionalTypeArgs, protected;

/// The responsive version of [View].
@optionalTypeArgs
abstract class Screen<T extends ViewModel> extends StatelessWidget
    with BaseView<T>, BaseScreenMixin<T> {
  Screen({
    this.listen = true,
    this.alwaysUseBuilder = false,
    ResponsiveSceneSettings settings = const ResponsiveSceneSettings(),
    super.key,
  }) : info = ResponsiveScreenInfo(settings);

  @override
  final bool listen;

  @override
  @protected
  final bool alwaysUseBuilder;

  @protected
  @override
  final ResponsiveScreenInfo info;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('viewModel', viewModel));
    properties.add(
      DiagnosticsProperty<bool>('alwaysUseBuilder', alwaysUseBuilder),
    );
    properties.add(DiagnosticsProperty<ResponsiveScreenInfo>('info', info));
  }
}

/// Holds the end points of the [Screen].
@immutable
final class ResponsiveSceneSettings {
  const ResponsiveSceneSettings({
    this.desktopChangePoint = 1200,
    this.tabletChangePoint = 600,
    this.watchChangePoint = 300,
  });

  /// When the width is greater or equal as this value,
  /// the display will be set as [ScreenType.desktop].
  final double desktopChangePoint;

  /// When the width is greater or equal as this value,
  /// the display will be set as [ScreenType.tablet].
  ///
  /// Also when the width is greater than [watchChangePoint] and smaller than this value,
  /// the display will be [ScreenType.phone].
  final double tabletChangePoint;

  /// When the width is greater or equal as this value,
  /// the display will be set as [ScreenType.watch].
  ///
  /// Also when the width is greater than [tabletChangePoint] and smaller than this value,
  /// the display will be [ScreenType.phone].
  final double watchChangePoint;
}

/// Every supported screen type.
enum ScreenType {
  watch,
  phone,
  tablet,
  desktop,
}
