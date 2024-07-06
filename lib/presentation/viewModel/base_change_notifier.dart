import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local_cache.dart';
import '../../utils/__export__.dart';

final baseViewModelRef = ChangeNotifierProvider<BaseChangeNotifier>((ref) {
  return BaseChangeNotifier();
});

class BaseChangeNotifier extends ChangeNotifier {
  late LocalCache localCache;
  BaseChangeNotifier({
    LocalCache? localCache,
  }) {
    this.localCache = localCache ?? locator();
  }

  String _activeTheme = locator<LocalCache>()
      .getFromLocalCache(AppConstants.activeThemeKey)
      .toString();
  String get activeTheme => _activeTheme;
  set activeTheme(String val) {
    _activeTheme = val;
    notifyListeners();
  }

  void refreshActiveTheme(){
    notifyListeners();
  }

  void switchTheme({
    required ProjectTheme destinationTheme,
  }) {
    localCache.saveToLocalCache(
      key: AppConstants.activeThemeKey,
      value: destinationTheme.name,
    );
    activeTheme = destinationTheme.name;
  }
}
