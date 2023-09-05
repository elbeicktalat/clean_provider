import 'package:clean_provider/src/_internal/internal.dart';
import 'package:clean_provider/src/interfaces/view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@optionalTypeArgs
abstract class ResponsiveScene<T extends ViewModel> extends StatelessWidget
    with BaseSceneMixin<T>, ResponsiveSceneMixin<T> {
  ResponsiveScene(
    this.viewModel, {
    this.alwaysUseBuilder = false,
    ResponsiveSceneSettings settings = const ResponsiveSceneSettings(),
    super.key,
  }) : screen = ResponsiveSceneData(settings);

  @override
  @protected
  @nonVirtual
  final T viewModel;

  @override
  @protected
  final bool alwaysUseBuilder;

  @override
  @protected
  final ResponsiveSceneData screen;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('viewModel', viewModel));
    properties.add(
      DiagnosticsProperty<bool>('alwaysUseBuilder', alwaysUseBuilder),
    );
    properties.add(DiagnosticsProperty<ResponsiveSceneData>('screen', screen));
  }
}

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

enum ScreenType {
  watch,
  phone,
  tablet,
  desktop,
}
