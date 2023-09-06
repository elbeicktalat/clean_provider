// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of internal;

/// The base mixin for every ViewWidget.
///
/// This mixin need a type parameter of [BaseViewModel].
@internal
@immutable
mixin BaseSceneMixin<T extends BaseViewModel> on StatelessWidget {
  /// Instance of the ViewModel.
  @protected
  T get viewModel;

  /// {@template crow.context}
  ///
  /// The [context] contains information about the location in the
  /// tree at which the associated widget is being built.
  ///
  /// This [context] get defined within [build] method.
  ///
  /// {@endtemplate}
  ///
  /// This is a shorthand for [viewModel.context].
  @protected
  @nonVirtual
  BuildContext get context => viewModel.context;

  /// The widget method which get the place of build method.
  @protected
  Widget? builder();

  /// The Widget build method, don't override this method instead use [builder].
  ///
  /// If do you override this than you'll lose the global context.
  @override
  @protected
  Widget build(final BuildContext context) {
    viewModel._context = context;
    return builder()!;
  }
}
