//  Copyright (c) 2023-2024 Talat El Beick. All rights reserved.
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

part of internal;

/// The parent of all ViewModels.
@internal
abstract class BaseViewModel extends ChangeNotifier {
  /// {@macro crow.context}
  @protected
  BuildContext get context => _context;
  late BuildContext _context;
}
