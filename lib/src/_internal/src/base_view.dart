// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of internal;

/// The base mixin for every [View] widget.
///
/// This mixin need a type parameter of [BaseViewModel].
@internal
@immutable
@optionalTypeArgs
mixin BaseView<T extends BaseViewModel> on StatelessWidget {
  /// Holds scree util info such as:
  /// * screen width
  /// * screen height
  @protected
  ScreenInfo get info;

  @protected
  bool get listen;

  /// Instance of [ViewModel].
  ///
  /// The viewModel will hold the logic you want to pass to the UI.
  @protected
  @nonVirtual
  T get viewModel => Provider.of<T>(context, listen: listen);

  /// {@template clean_provider.context}
  ///
  /// The [context] contains information about the location in the
  /// tree at which the associated widget is being built.
  ///
  /// This [context] get defined within [build] method.
  ///
  /// {@endtemplate}
  ///
  /// This is a shorthand for `info.context`.
  @protected
  @nonVirtual
  BuildContext get context => info._context;

  /// The widget method which get the place of build method.
  @protected
  Widget? builder();

  /// The Widget build method, don't override this method instead use [builder].
  ///
  /// If you do override this method than you'll lose the global context.
  @override
  @protected
  Widget build(final BuildContext context) {
    info._context = context;
    viewModel._context = context;
    return builder()!;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ScreenInfo>('info', info));
    properties.add(DiagnosticsProperty<bool>('listen', listen));
    properties.add(DiagnosticsProperty<T>('viewModel', viewModel));
    properties.add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
