import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/screens/auth/selection_role_screen.dart';
import 'package:senior_project_ruccab/screens/auth/signin_screen.dart';
import 'package:senior_project_ruccab/screens/book_ride_main_screen.dart';
import 'package:senior_project_ruccab/screens/car_ride_screen.dart';
import 'package:senior_project_ruccab/screens/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // Navigate to next screen after animation completes
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 10),
            curve: Curves.easeInOut,
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0, 
            right: 0,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
