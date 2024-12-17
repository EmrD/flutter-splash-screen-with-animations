import 'package:flutter/material.dart';
import './home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var alignment = Alignment.centerRight;
  var opacity = 0.0;
  bool exitAnimationStarted = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        alignment = Alignment.center;
        opacity = 1.0;
      });
    });
  }

  void triggerExitAnimation() {
    setState(() {
      alignment = Alignment.centerLeft;
      opacity = 0.0;
      exitAnimationStarted = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedAlign(
        alignment: alignment,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        onEnd: () {
          Future.delayed(const Duration(seconds: 3), () {
            if (!exitAnimationStarted) {
              triggerExitAnimation();
            }
          });
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          opacity: opacity,
          child: const Text(
            "Splash Screen Example",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
