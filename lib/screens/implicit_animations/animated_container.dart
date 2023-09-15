import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _visible = true;
  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Implicit Animations',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                  color: _visible ? Colors.indigo : Colors.amber,
                  borderRadius: BorderRadius.circular(_visible ? 100 : 0)),
              duration: const Duration(seconds: 1),
              width: _visible ? size.width : size.width * 0.8,
              height: _visible ? size.width : size.width * 0.8,
              transform: Matrix4.rotationZ(_visible ? 1 : 0),
              transformAlignment: Alignment.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: _trigger, child: const Text('Go!'))
          ],
        ),
      ),
    );
  }
}
