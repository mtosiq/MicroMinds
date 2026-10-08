import 'package:flutter/material.dart';
import 'package:MicroMinds/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MicroMinds/src/views/Navigation_Screen.dart';
import 'package:MicroMinds/src/views/Authentication%20Screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String loginKey = "login";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin, ThemeColors {
  late AnimationController logoController;
  late AnimationController contentController;
  late AnimationController pulseController;
  late AnimationController progressController;

  late Animation<double> logoScale;
  late Animation<double> logoRotation;
  late Animation<double> fadeAnimation;
  late Animation<double> slideAnimation;
  late Animation<double> pulseAnimation;
  late Animation<double> progressAnimation;

  // ============================================================
  // COLORS
  // ============================================================

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );

    logoScale = Tween<double>(
      begin: 0.35,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    logoRotation = Tween<double>(
      begin: -0.08,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.easeOutBack,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: contentController,
        curve: Curves.easeOut,
      ),
    );

    slideAnimation = Tween<double>(
      begin: 25,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: contentController,
        curve: Curves.easeOutCubic,
      ),
    );

    pulseAnimation = Tween<double>(
      begin: 0.97,
      end: 1.04,
    ).animate(
      CurvedAnimation(
        parent: pulseController,
        curve: Curves.easeInOut,
      ),
    );

    progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: progressController,
        curve: Curves.easeInOut,
      ),
    );

    startSplash();
  }

  // ============================================================
  // SPLASH FLOW
  // ============================================================

  Future<void> startSplash() async {
    await logoController.forward();

    await Future.delayed(
      const Duration(milliseconds: 250),
    );

    await contentController.forward();

    progressController.forward();

    await Future.delayed(
      const Duration(milliseconds: 2700),
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuth.instance.currentUser == null
            ? const LoginScreen()
            : const MainNavigation(),
      ),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    logoController.dispose();
    contentController.dispose();
    pulseController.dispose();
    progressController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          logoController,
          contentController,
          pulseController,
          progressController,
        ]),
        builder: (context, child) {
          return Stack(
            children: [
              // ========================================================
              // BACKGROUND
              // ========================================================

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.deepPanel,
                      AppColors.deepBackground,
                      AppColors.authBackground,
                    ],
                  ),
                ),
              ),

              // ========================================================
              // ORANGE GLOW
              // ========================================================

              Positioned(
                top: -160,
                left: -120,
                child: glow(
                  orange,
                  360,
                ),
              ),

              // ========================================================
              // PURPLE GLOW
              // ========================================================

              Positioned(
                top: 250,
                right: -170,
                child: glow(
                  purple,
                  380,
                ),
              ),

              // ========================================================
              // GREEN GLOW
              // ========================================================

              Positioned(
                bottom: -180,
                left: -80,
                child: glow(
                  green,
                  330,
                ),
              ),

              // ========================================================
              // DECORATIVE CIRCLES
              // ========================================================

              Positioned(
                top: 100,
                right: 35,
                child: decorativeCircle(
                  10,
                  purple,
                ),
              ),

              Positioned(
                top: 190,
                left: 35,
                child: decorativeCircle(
                  7,
                  orange,
                ),
              ),

              Positioned(
                bottom: 170,
                right: 45,
                child: decorativeCircle(
                  8,
                  green,
                ),
              ),

              // ========================================================
              // MAIN CONTENT
              // ========================================================

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ====================================================
                    // LOGO
                    // ====================================================

                    Transform.translate(
                      offset: Offset(
                        0,
                        slideAnimation.value,
                      ),
                      child: Transform.rotate(
                        angle: logoRotation.value,
                        child: Transform.scale(
                          scale: logoScale.value * pulseAnimation.value,
                          child: buildLogo(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ====================================================
                    // APP NAME
                    // ====================================================

                    FadeTransition(
                      opacity: fadeAnimation,
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          slideAnimation.value,
                        ),
                        child: const Text(
                          "NutriChef AI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ====================================================
                    // TAGLINE
                    // ====================================================

                    FadeTransition(
                      opacity: fadeAnimation,
                      child: const Text(
                        "Eat smart. Train better. Live healthier.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                          letterSpacing: .4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ====================================================
                    // FEATURE PILLS
                    // ====================================================

                    FadeTransition(
                      opacity: fadeAnimation,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          featurePill(
                            icon: Icons.restaurant_rounded,
                            text: "Recipes",
                            color: orange,
                          ),
                          const SizedBox(width: 7),
                          featurePill(
                            icon: Icons.local_fire_department_rounded,
                            text: "Nutrition",
                            color: green,
                          ),
                          const SizedBox(width: 7),
                          featurePill(
                            icon: Icons.fitness_center_rounded,
                            text: "Fitness",
                            color: purple,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 45),

                    // ====================================================
                    // AI STATUS CARD
                    // ====================================================

                    FadeTransition(
                      opacity: fadeAnimation,
                      child: Container(
                        width: 270,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: cardColor.withOpacity(.9),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white.withOpacity(.06),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    orange,
                                    purple,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "AI Nutrition Assistant",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Preparing your experience...",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ====================================================
                    // PROGRESS BAR
                    // ====================================================

                    FadeTransition(
                      opacity: fadeAnimation,
                      child: SizedBox(
                        width: 180,
                        child: Column(
                          children: [
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.07),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          orange,
                                          purple,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Personalizing your journey",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 9,
                                letterSpacing: .5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ========================================================
              // VERSION
              // ========================================================

              Positioned(
                bottom: 28,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: const Text(
                    "SMART NUTRITION • AI • FITNESS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 8,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  Widget buildLogo() {
    return Container(
      height: 145,
      width: 145,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            orange,
            purple,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: orange.withOpacity(.25),
            blurRadius: 45,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: purple.withOpacity(.18),
            blurRadius: 70,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: cardColor,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // INNER GLOW

            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    orange.withOpacity(.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // MAIN ICON

            const Icon(
              Icons.restaurant_rounded,
              color: Colors.white,
              size: 57,
            ),

            // FITNESS BADGE

            Positioned(
              right: 17,
              bottom: 20,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: cardColor,
                    width: 4,
                  ),
                ),
                child: const Icon(
                  Icons.fitness_center_rounded,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // FEATURE PILL
  // ============================================================

  Widget featurePill({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 13,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // GLOW
  // ============================================================

  Widget glow(
    Color color,
    double size,
  ) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(.20),
            color.withOpacity(.06),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DECORATIVE DOT
  // ============================================================

  Widget decorativeCircle(
    double size,
    Color color,
  ) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(.5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.3),
            blurRadius: 15,
          ),
        ],
      ),
    );
  }
}
