// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:clean_provider/src/_internal/internal.dart';
import 'package:clean_provider/src/contracts/view_model.dart';
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;
import 'package:meta/meta.dart' show nonVirtual, optionalTypeArgs, protected;

/// Extends the [StatelessWidget] to the next level offer you a clean approach
/// to build your UI.
///
/// The instance of [viewModel] injected via the contracture,
/// will allows you to meet your logic in a clean.
@optionalTypeArgs
abstract class View<T extends ViewModel> extends StatelessWidget
    with BaseView<T> {
  View({
    this.listen = true,
    super.key,
  }) : info = ScreenInfo();

  @override
  final bool listen;

  @override
  final ScreenInfo info;

  @override
  @protected
  @nonVirtual
  Widget build(BuildContext context) => super.build(context);
}
