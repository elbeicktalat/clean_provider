// Copyright (c) 2023-2024. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

library internal;

import 'dart:io' show Platform;

import 'package:clean_provider/src/contracts/screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, ChangeNotifier, MediaQuery, StatelessWidget, Widget;
import 'package:meta/meta.dart' show internal, immutable, protected, nonVirtual;
import 'package:provider/provider.dart' show Provider;

part 'src/base_screen.dart';
part 'src/base_view.dart';
part 'src/base_view_model.dart';
part 'src/screen_info.dart';
