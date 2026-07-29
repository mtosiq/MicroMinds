import 'package:flutter/material.dart';
import 'package:MicroMinds/src/views/Navigation_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController logoController;
  late AnimationController textController;
  late AnimationController pulseController;

  late Animation<double> logoScale;
  late Animation<double> textFade;
  late Animation<double> pulse;

  static const Color background = Color(0xff050507);

  static const Color orange = Color(0xffff6b4a);

  static const Color purple = Color(0xff9b5cff);

  static const Color green = Color(0xff35D07F);

  @override
  void initState() {
    super.initState();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    logoScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    textFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: textController,
        curve: Curves.easeIn,
      ),
    );

    pulse = Tween<double>(
      begin: .95,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: pulseController,
        curve: Curves.easeInOut,
      ),
    );

    startSplash();
  }

  Future<void> startSplash() async {
    await logoController.forward();

    await textController.forward();

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigation(),
      ),
    );
  }

  @override
  void dispose() {
    logoController.dispose();

    textController.dispose();

    pulseController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          logoController,
          textController,
          pulseController,
        ]),
        builder: (context, child) {
          return Stack(
            children: [
              // Background

              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 1.3,
                    colors: [
                      Color(0xff24120D),
                      Color(0xff15101F),
                      Color(0xff050507),
                    ],
                  ),
                ),
              ),

              // Glow Effects

              Positioned(
                top: -100,
                left: -80,
                child: glow(
                  orange,
                  260,
                ),
              ),

              Positioned(
                right: -100,
                top: 150,
                child: glow(
                  purple,
                  280,
                ),
              ),

              Positioned(
                bottom: -100,
                left: 80,
                child: glow(
                  green,
                  220,
                ),
              ),

              // Floating Food

              const Positioned(
                top: 150,
                left: 45,
                child: FoodBubble(
                  emoji: "🥕",
                ),
              ),

              const Positioned(
                top: 240,
                right: 45,
                child: FoodBubble(
                  emoji: "🍅",
                ),
              ),

              const Positioned(
                bottom: 220,
                left: 60,
                child: FoodBubble(
                  emoji: "🥑",
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: logoScale.value * pulse.value,
                      child: logo(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeTransition(
                      opacity: textFade,
                      child: const Text(
                        "ChefAI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    FadeTransition(
                      opacity: textFade,
                      child: const Text(
                        "Your Personal AI Cooking Assistant",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    FadeTransition(
                      opacity: textFade,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          badge("🍽 Recipes", orange),
                          const SizedBox(width: 8),
                          badge("📸 Scan", purple),
                          const SizedBox(width: 8),
                          badge("🥗 Healthy", green),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FadeTransition(
                      opacity: textFade,
                      child: const Text(
                        "AI Chef is preparing ideas...",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            orange,
            purple,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: orange.withOpacity(.4),
            blurRadius: 45,
            spreadRadius: 8,
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Color(0xff15171D),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            "👨‍🍳",
            style: TextStyle(
              fontSize: 65,
            ),
          ),
        ),
      ),
    );
  }

  Widget badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(.4),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget glow(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(.35),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class FoodBubble extends StatelessWidget {
  final String emoji;

  const FoodBubble({
    super.key,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: const Color(0xff15171D),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            blurRadius: 15,
          )
        ],
      ),
      child: Center(
        child: Text(
          emoji,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
