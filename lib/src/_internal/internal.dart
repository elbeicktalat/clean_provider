// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

library internal;

import 'dart:io' show Platform;

import 'package:clean_provider/src/contracts/responsive_scene.dart';
import 'package:clean_provider/src/contracts/view_model.dart';
import 'package:flutter/material.dart'
    show Widget, StatelessWidget, BuildContext, MediaQuery, ChangeNotifier;
import 'package:meta/meta.dart' show internal, immutable, protected, nonVirtual;

part 'base_responsive_scene.dart';
part 'base_scene.dart';
part 'base_view_model.dart';

/// Inject an instance of [ViewModel] and return a [Scene] widget.
@internal
typedef SceneBuilder<V extends ViewModel> = Widget Function(V viewModel);
