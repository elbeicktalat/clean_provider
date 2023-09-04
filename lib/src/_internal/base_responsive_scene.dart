part of internal;

@internal
@immutable
mixin ResponsiveSceneMixin<T extends BaseViewModel> on BaseSceneMixin<T> {
  @protected
  ResponsiveSceneData get screen;

  @protected
  bool get alwaysUseBuilder;

  @override
  @protected
  @nonVirtual
  Widget build(BuildContext context) {
    viewModel._context = context;
    screen._context = context;
    Widget? widget;
    if (alwaysUseBuilder) {
      widget = builder();
      if (widget != null) return widget;
    }
    if (screen.isDesktop) {
      widget = desktop() ?? widget;
      if (widget != null) return widget;
    }
    if (screen.isTablet) {
      widget = tablet() ?? desktop();
      if (widget != null) return widget;
    }
    if (screen.isPhone) {
      widget = phone() ?? tablet() ?? desktop();
      if (widget != null) return widget;
    }
    return watch() ?? phone() ?? tablet() ?? desktop() ?? builder()!;
  }

  @override
  @protected
  Widget? builder() => null;

  @protected
  Widget? desktop() => null;

  @protected
  Widget? phone() => null;

  @protected
  Widget? tablet() => null;

  @protected
  Widget? watch() => null;
}

final class ResponsiveSceneData {
  ResponsiveSceneData(this._settings);

  final ResponsiveSceneSettings _settings;

  late BuildContext _context;

  bool get _isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  double get width => MediaQuery.of(_context).size.width;

  double get height => MediaQuery.of(_context).size.height;

  /// Whether [screenType] is [ScreenType.desktop]
  bool get isDesktop => screenType == ScreenType.desktop;

  /// Whether [screenType] is [ScreenType.tablet]
  bool get isTablet => screenType == ScreenType.tablet;

  /// Whether [screenType] is [ScreenType.phone]
  bool get isPhone => screenType == ScreenType.phone;

  /// Whether [screenType] is [ScreenType.watch]
  bool get isWatch => screenType == ScreenType.watch;

  double get _getDeviceWidth {
    if (_isDesktop) {
      return width;
    }
    return MediaQuery.of(_context).size.shortestSide;
  }

  /// Return the current [ScreenType].
  ScreenType get screenType {
    if (_getDeviceWidth >= _settings.desktopChangePoint) return ScreenType.desktop;
    if (_getDeviceWidth >= _settings.tabletChangePoint) return ScreenType.tablet;
    if (_getDeviceWidth < _settings.watchChangePoint) return ScreenType.watch;
    return ScreenType.phone;
  }

  /// Return widget according to screen type.
  ///
  /// If the [screenType] is [ScreenType.desktop] and `desktop` object is null, the `tablet` object will be returned.
  /// If the [screenType] is [ScreenType.tablet] and `tablet` object is null, the `mobile` object will be returned.
  /// If the [screenType] is [ScreenType.phone] and `phone` object is null, the `watch` object will be returned, also when it is null.
  T? responsiveValue<T>({
    T? phone,
    T? tablet,
    T? desktop,
    T? watch,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    if (isPhone && phone != null) return phone;
    return watch;
  }
}
