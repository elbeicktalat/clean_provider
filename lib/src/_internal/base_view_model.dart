// Copyright (c) 2023. Talat El Beick. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of internal;

/// The parent of all [ViewModel]s.
@internal
abstract class BaseViewModel extends ChangeNotifier {
  /// {@macro clean_provider.context}
  @protected
  @nonVirtual
  BuildContext get context => _context;
  late BuildContext _context;
}
