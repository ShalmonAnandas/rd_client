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

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> getNavigatorKey() => _navigatorKey;

  void addAdapter(Object adapter) {}

  void showInspector() {}
}
