import 'package:clean_provider/clean_provider.dart';
import 'package:clean_provider/src/_internal/internal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show StatelessWidget;

abstract class Scene<T extends ViewModel> extends StatelessWidget
    with BaseSceneMixin<T> {
  const Scene(
    this.viewModel, {
    super.key,
  });

  @override
  final T viewModel;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('viewModel', viewModel));
  }
}
