import 'package:clean_provider/src/interfaces/view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef _InstanceOfViewWidget<V> = Widget Function(V viewModel);

final class SceneConsumer<T extends ViewModel> extends StatelessWidget {
  const SceneConsumer(
    this._sceneBuilder, {
    required this.providers,
    super.key,
  });

  final List<SingleChildWidget> providers;

  final _InstanceOfViewWidget<T> _sceneBuilder;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
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
