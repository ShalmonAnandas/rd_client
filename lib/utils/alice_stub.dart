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

  GlobalKey<NavigatorState> getNavigatorKey() => GlobalKey<NavigatorState>();

  void addAdapter(Object adapter) {}

  void showInspector() {}
}
