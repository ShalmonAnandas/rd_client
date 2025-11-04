import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rd_client/presentation/screens/search_screen.dart';
import 'package:rd_client/widgets/glass_text_field.dart';

class SearchEntryPoint extends StatefulWidget {
  const SearchEntryPoint({super.key});

  @override
  State<SearchEntryPoint> createState() => _SearchEntryPointState();
}

class _SearchEntryPointState extends State<SearchEntryPoint>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late AnimationController _textController;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(seconds: 8 + index * 2),
        vsync: this,
      )..repeat(reverse: true),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // First line animations
    _fadeAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _slideAnimation1 =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          ),
        );

    // Second line animations (delayed)
    _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation2 =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
          ),
        );

    _textController.forward();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated blurred swirling lights background
        ...List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Positioned(
                left: _getXPosition(index, _animations[index].value),
                top: _getYPosition(index, _animations[index].value),
                child: Container(
                  width: 300 + (index * 50),
                  height: 300 + (index * 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: _getGradientColors(index),
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
        // Main content
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return Column(
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation1,
                      child: SlideTransition(
                        position: _slideAnimation1,
                        child: Text(
                          'What are we',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: SlideTransition(
                        position: _slideAnimation2,
                        child: Text(
                          'Watching Today?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.8,
                            height: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Hero(
                tag: 'search_textfield',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SearchScreen(),
                            transitionDuration: const Duration(
                              milliseconds: 400,
                            ),
                            reverseTransitionDuration: const Duration(
                              milliseconds: 400,
                            ),
                            opaque: false,
                          ),
                        );
                      },
                      child: GlassTextField(enabled: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  double _getXPosition(int index, double animationValue) {
    final screenWidth = MediaQuery.of(context).size.width;
    switch (index) {
      case 0:
        return screenWidth * 0.1 +
            sin(animationValue * 2 * pi) * screenWidth * 0.2;
      case 1:
        return screenWidth * 0.6 +
            cos(animationValue * 2 * pi) * screenWidth * 0.25;
      case 2:
        return screenWidth * 0.3 +
            sin(animationValue * 2 * pi + pi / 2) * screenWidth * 0.3;
      default:
        return 0;
    }
  }

  double _getYPosition(int index, double animationValue) {
    final screenHeight = MediaQuery.of(context).size.height;
    switch (index) {
      case 0:
        return screenHeight * 0.2 +
            cos(animationValue * 2 * pi) * screenHeight * 0.3;
      case 1:
        return screenHeight * 0.5 +
            sin(animationValue * 2 * pi) * screenHeight * 0.2;
      case 2:
        return screenHeight * 0.6 +
            cos(animationValue * 2 * pi + pi / 3) * screenHeight * 0.25;
      default:
        return 0;
    }
  }

  List<Color> _getGradientColors(int index) {
    switch (index) {
      case 0:
        return [
          Color(0xFFB388FF).withOpacity(0.5),
          Color(0xFF82B1FF).withOpacity(0.4),
          Colors.transparent,
        ];
      case 1:
        return [
          Color(0xFFFF80AB).withOpacity(0.45),
          Color(0xFFFFAB91).withOpacity(0.35),
          Colors.transparent,
        ];
      case 2:
        return [
          Color(0xFF80DEEA).withOpacity(0.45),
          Color(0xFF80CBC4).withOpacity(0.35),
          Colors.transparent,
        ];
      default:
        return [Colors.transparent, Colors.transparent, Colors.transparent];
    }
  }
}
