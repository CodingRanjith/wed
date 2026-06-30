import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/widgets/techackode_brand_footer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  static const _logoAsset = 'assets/images/logo/logo.png';

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.go(RoutePaths.welcome);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Image.asset(
                      _logoAsset,
                      width: width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const TechackodeBrandFooter(light: true, compact: true),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
