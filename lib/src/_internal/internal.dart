// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

library internal;

import 'dart:io';

import 'package:clean_provider/src/interfaces/responsive_scene.dart';
import 'package:clean_provider/src/interfaces/view_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'base_responsive_scene.dart';
part 'base_scene.dart';
part 'base_view_model.dart';

@internal
typedef SceneBuilder<V extends ViewModel> = Widget Function(V viewModel);
