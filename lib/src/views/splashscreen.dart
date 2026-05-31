import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:foodapp/src/views/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ── Controllers ──────────────────────────────────────────────────
  late final AnimationController _bgCtrl;
  late final AnimationController _logoCtrl;
  late final AnimationController _pulseCtrl;
  late final AnimationController _orbitCtrl;
  late final AnimationController _textCtrl;
  late final AnimationController _circuitCtrl;
  late final AnimationController _ringCtrl;

  // ── Animations ───────────────────────────────────────────────────
  late final Animation<double> _bgFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoRotate;
  late final Animation<double> _pulse;
  late final Animation<double> _orbit;
  late final Animation<double> _titleOpacity;
  late final Animation<double> _titleSlide;
  late final Animation<double> _subtitleOpacity;
  late final Animation<double> _badgeOpacity;
  late final Animation<double> _circuit;
  late final Animation<double> _ring;

  // ── Palette ──────────────────────────────────────────────────────
  static const _bg1 = Color(0xFF030B14);
  static const _bg2 = Color(0xFF071220);
  static const _green = Color(0xFF00C896);
  static const _blue = Color(0xFF0095FF);
  static const _orange = Color(0xFFFF6B35);
  static const _white = Color(0xFFF0F8FF);
  static const _muted = Color(0xFF7A9BB5);

  @override
  void initState() {
    super.initState();

    _bgCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _logoCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _pulseCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2400))
      ..repeat(reverse: true);
    _orbitCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 7000))
      ..repeat();
    _textCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _circuitCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
    _ringCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat();

    _bgFade = CurvedAnimation(parent: _bgCtrl, curve: Curves.easeIn);
    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.65, curve: Curves.elasticOut)));
    _logoRotate = Tween<double>(begin: 0.4, end: 0.0).animate(CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOut)));
    _pulse = Tween<double>(begin: 0.92, end: 1.08)
        .animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
    _orbit = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_orbitCtrl);
    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeOut));
    _titleSlide = Tween<double>(begin: 28.0, end: 0.0)
        .animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeOut));
    _subtitleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _textCtrl,
            curve: const Interval(0.35, 1.0, curve: Curves.easeOut)));
    _badgeOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _textCtrl,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut)));
    _circuit = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _circuitCtrl, curve: Curves.linear));
    _ring = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _ringCtrl, curve: Curves.easeInOut));

    // Sequence
    _bgCtrl.forward().then((_) {
      _logoCtrl.forward().then((_) {
        _textCtrl.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 1400), _navigate);
        });
      });
    });
  }

  void _navigate() {
    if (!mounted) return;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => Homepage(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _logoCtrl.dispose();
    _pulseCtrl.dispose();
    _orbitCtrl.dispose();
    _textCtrl.dispose();
    _circuitCtrl.dispose();
    _ringCtrl.dispose();
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _bg1,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _bgCtrl,
          _logoCtrl,
          _pulseCtrl,
          _orbitCtrl,
          _textCtrl,
          _circuitCtrl,
          _ringCtrl,
        ]),
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 1.4,
                colors: [
                  Color.lerp(_bg1, const Color(0xFF071A30), _bgFade.value)!,
                  Color.lerp(_bg1, _bg2, _bgFade.value)!,
                  _bg1,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Grid pattern background
                Opacity(
                  opacity: 0.04 * _bgFade.value,
                  child: CustomPaint(
                    size: size,
                    painter: _GridPainter(),
                  ),
                ),

                // Ambient glows
                _glow(Alignment(-0.6, -0.5), _green, 180, 0.10),
                _glow(Alignment(0.6, -0.3), _blue, 200, 0.08),
                _glow(Alignment(0.0, 0.5), _orange, 160, 0.07),

                // Main content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ── Logo ──────────────────────────────────────
                    SizedBox(
                      width: 240,
                      height: 240,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer scanning ring
                          CustomPaint(
                            size: const Size(220, 220),
                            painter: _ScanRingPainter(
                              progress: _ring.value,
                              color: _green,
                              opacity: _logoScale.value,
                            ),
                          ),

                          // Orbiting macro icons
                          Transform.rotate(
                            angle: _orbit.value,
                            child: SizedBox(
                              width: 210,
                              height: 210,
                              child: Stack(children: [
                                _orbitIcon(0, '🥦', _orbit.value),
                                _orbitIcon(math.pi * 0.5, '💪', _orbit.value),
                                _orbitIcon(math.pi, '🧬', _orbit.value),
                                _orbitIcon(math.pi * 1.5, '⚡', _orbit.value),
                              ]),
                            ),
                          ),

                          // Pulse glow behind logo
                          Transform.scale(
                            scale: _pulse.value,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(colors: [
                                  _green.withOpacity(0.18 * _logoScale.value),
                                  _blue.withOpacity(0.10 * _logoScale.value),
                                  Colors.transparent,
                                ]),
                              ),
                            ),
                          ),

                          // Logo mark
                          Transform.scale(
                            scale: _logoScale.value,
                            child: Transform.rotate(
                              angle: _logoRotate.value,
                              child: _logoMark(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── App name ──────────────────────────────────
                    Transform.translate(
                      offset: Offset(0, _titleSlide.value),
                      child: Opacity(
                        opacity: _titleOpacity.value,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Macro',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  color: _white,
                                ),
                              ),
                              TextSpan(
                                text: 'Minds',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  color: _green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Tagline
                    Opacity(
                      opacity: _subtitleOpacity.value,
                      child: const Text(
                        'AI · Nutrition · Performance',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3.5,
                          color: _muted,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Badges
                    Opacity(
                      opacity: _badgeOpacity.value,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _badge('🍳  Recipes', _green),
                          const SizedBox(width: 10),
                          _badge('🧠  AI Powered', _blue),
                          const SizedBox(width: 10),
                          _badge('💪  Fitness', _orange),
                        ],
                      ),
                    ),
                  ],
                ),

                // Bottom loading bar
                Positioned(
                  bottom: 52,
                  child: Opacity(
                    opacity: _badgeOpacity.value,
                    child: _loadingBar(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Logo mark ──────────────────────────────────────────────────────

  Widget _logoMark() {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A1F35), Color(0xFF071525)],
        ),
        border: Border.all(
          color: _green.withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
              color: _green.withOpacity(0.25), blurRadius: 30, spreadRadius: 4),
          BoxShadow(
              color: _blue.withOpacity(0.15), blurRadius: 20, spreadRadius: 2),
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circuit lines painted inside
          CustomPaint(
            size: const Size(130, 130),
            painter: _CircuitPainter(
              progress: _circuit.value,
              color: _green,
            ),
          ),
          // Brain + bolt icon
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🧠', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 2),
              Container(
                width: 40,
                height: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    _green.withOpacity(0),
                    _green,
                    _green.withOpacity(0),
                  ]),
                ),
              ),
              const SizedBox(height: 4),
              const Text('⚡', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  // ── Helper widgets ─────────────────────────────────────────────────

  Widget _orbitIcon(double angle, String emoji, double currentAngle) {
    const r = 105.0;
    final x = r + r * math.cos(angle) - 16;
    final y = r + r * math.sin(angle) - 16;
    return Positioned(
      left: x,
      top: y,
      child: Transform.rotate(
        angle: -currentAngle,
        child: Text(emoji, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _glow(Alignment align, Color color, double size, double opacity) {
    return Align(
      alignment: align,
      child: Opacity(
        opacity: opacity * _bgFade.value,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, color.withOpacity(0)]),
          ),
        ),
      ),
    );
  }

  Widget _badge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3), width: 0.8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: color,
        ),
      ),
    );
  }

  Widget _loadingBar() {
    return AnimatedBuilder(
      animation: _orbitCtrl,
      builder: (_, __) {
        final progress = _orbitCtrl.value;
        return Column(
          children: [
            Container(
              width: 160,
              height: 2,
              decoration: BoxDecoration(
                color: _green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: (progress * 1.4).clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      gradient: LinearGradient(colors: [_green, _blue]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Initializing AI Engine...',
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 1.5,
                color: _muted.withOpacity(0.7),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ── Custom Painters ──────────────────────────────────────────────────────────

class _ScanRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double opacity;
  const _ScanRingPainter(
      {required this.progress, required this.color, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0) return;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Static ring
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withOpacity(0.12 * opacity)
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    // Scanning arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(
      rect,
      progress * 2 * math.pi - math.pi / 2,
      math.pi * 0.6,
      false,
      Paint()
        ..color = color.withOpacity(0.7 * opacity)
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Tick marks
    for (int i = 0; i < 12; i++) {
      final angle = (i / 12) * 2 * math.pi;
      final outer = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      final inner = Offset(
        center.dx + (radius - 8) * math.cos(angle),
        center.dy + (radius - 8) * math.sin(angle),
      );
      canvas.drawLine(
        outer,
        inner,
        Paint()
          ..color = color.withOpacity(0.2 * opacity)
          ..strokeWidth = 1,
      );
    }
  }

  @override
  bool shouldRepaint(_ScanRingPainter old) =>
      old.progress != progress || old.opacity != opacity;
}

class _CircuitPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _CircuitPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.25)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    final cx = size.width / 2;
    final cy = size.height / 2;

    // Horizontal lines
    canvas.drawLine(Offset(cx - 40, cy - 20), Offset(cx - 20, cy - 20), paint);
    canvas.drawLine(Offset(cx + 20, cy - 20), Offset(cx + 40, cy - 20), paint);
    canvas.drawLine(Offset(cx - 40, cy + 20), Offset(cx - 20, cy + 20), paint);
    canvas.drawLine(Offset(cx + 20, cy + 20), Offset(cx + 40, cy + 20), paint);

    // Nodes
    final nodePaint = Paint()
      ..color = color
          .withOpacity(0.4 * (0.5 + 0.5 * math.sin(progress * 2 * math.pi)))
      ..style = PaintingStyle.fill;

    for (final pos in [
      Offset(cx - 40, cy - 20),
      Offset(cx + 40, cy - 20),
      Offset(cx - 40, cy + 20),
      Offset(cx + 40, cy + 20),
    ]) {
      canvas.drawCircle(pos, 2.5, nodePaint);
    }
  }

  @override
  bool shouldRepaint(_CircuitPainter old) => old.progress != progress;
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00C896)
      ..strokeWidth = 0.5;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}
