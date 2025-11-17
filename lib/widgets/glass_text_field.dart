import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassTextField extends StatefulWidget {
  final bool enabled;
  final bool autoFocus;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const GlassTextField({
    super.key,
    this.enabled = true,
    this.autoFocus = false,
    this.controller,
    this.onChanged,
  });

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: LiquidGlassLayer(
          settings: const LiquidGlassSettings(
            thickness: 20,
            blur: 2,
            refractiveIndex: 2,
          ),
          child: LiquidGlass(
            shape: LiquidRoundedRectangle(borderRadius: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: widget.controller,
                enabled: widget.enabled,
                autofocus: widget.autoFocus,
                onChanged: widget.onChanged,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  icon: Icon(
                    LucideIcons.search,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
