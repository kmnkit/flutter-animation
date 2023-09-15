import 'package:flutter/material.dart';

// Explicit Animation의 모든 출발은 AnimationController에서 시작된다.
class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() => _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final Animation<Color?> _color = ColorTween(
    begin: Colors.amber,
    end: Colors.purple,
  ).animate(_controller);

  void _play() => _controller.forward();
  void _pause() => _controller.stop();
  void _rewind() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    print('빌드');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animation Value",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _color,
                builder: (context, child) {
                  return Opacity(
                    opacity: _controller.value,
                    child: Container(
                      color: _color.value,
                      width: 400,
                      height: 400,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _play,
                    child: const Text("Play"),
                  ),
                  ElevatedButton(
                    onPressed: _pause,
                    child: const Text("Pause"),
                  ),
                  ElevatedButton(
                    onPressed: _rewind,
                    child: const Text("Reverse"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
