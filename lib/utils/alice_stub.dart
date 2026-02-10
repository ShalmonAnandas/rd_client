import 'package:flutter/material.dart';

class AliceConfiguration {
  final bool showInspectorOnShake;
  final bool showNotification;

  const AliceConfiguration({
    required this.showInspectorOnShake,
    required this.showNotification,
  });
}

class Alice {
  Alice({required AliceConfiguration configuration});

  GlobalKey<NavigatorState> getNavigatorKey() {
    throw UnsupportedError('Alice inspector is not supported on this platform.');
  }

  void addAdapter(Object adapter) {}

  void showInspector() {}
}
