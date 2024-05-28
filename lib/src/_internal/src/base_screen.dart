// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of internal;

/// The responsive version of [BaseView].
@internal
@immutable
mixin BaseScreenMixin<T extends BaseViewModel> on BaseView<T> {
  /// Force the [build] method to ignore other widget methods and return the [builder].
  @protected
  bool get alwaysUseBuilder;

  /// Holds scree util info such as:
  /// * screen width
  /// * screen height
  /// * current screen type
  @override
  ResponsiveScreenInfo get info;

  @override
  @protected
  @nonVirtual
  Widget build(BuildContext context) {
    info._context = context;
    viewModel._context = context;
    Widget? widget;
    if (alwaysUseBuilder) {
      widget = builder();
      if (widget != null) return widget;
    }
    if (info.isDesktop) {
      widget = desktop() ?? widget;
      if (widget != null) return widget;
    }
    if (info.isTablet) {
      widget = tablet() ?? desktop();
      if (widget != null) return widget;
    }
    if (info.isPhone) {
      widget = phone() ?? tablet() ?? desktop();
      if (widget != null) return widget;
    }
    return watch() ?? phone() ?? tablet() ?? desktop() ?? builder()!;
  }

  @override
  @protected
  Widget? builder() => null;

  /// The widget method which get invoked if the current screen has a `desktop` size.
  @protected
  Widget? desktop() => null;

  /// The widget method which get invoked if the current screen has a `tablet` size.
  @protected
  Widget? tablet() => null;

  /// The widget method which get invoked if the current screen has a `phone` size.
  @protected
  Widget? phone() => null;

  /// The widget method which get invoked if the current screen has a `watch` size.
  @protected
  Widget? watch() => null;
}
