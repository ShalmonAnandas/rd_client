import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double maxWidth;
  static const EdgeInsets _defaultPadding = EdgeInsets.zero;

  const ResponsiveBody({
    super.key,
    required this.child,
    this.padding = _defaultPadding,
    this.maxWidth = 900,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1200;
        final effectiveMaxWidth = isWideScreen
            ? constraints.maxWidth * 0.8
            : maxWidth;

        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
            child: Padding(padding: padding, child: child),
          ),
        );
      },
    );
  }
}
