import 'package:animations_master/screens/apple_watch/apple_watch_screen.dart';
import 'package:animations_master/screens/explicit_animations/animation_status_screen.dart';
import 'package:animations_master/screens/explicit_animations/value_notifier.dart';
import 'package:animations_master/screens/implicit_animations/implicit_animations_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _goToPage(BuildContext context, Widget screen) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Animations',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(
                context,
                const ImplicitAnimationsScreen(),
              ),
              child: const Text(
                'Impllicit Animations',
              ),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(
                context,
                const AnimationStatusScreen(),
              ),
              child: const Text(
                'Explicit Animations',
              ),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(
                context,
                const AppleWatchScreen(),
              ),
              child: const Text(
                'Apple Watch Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
