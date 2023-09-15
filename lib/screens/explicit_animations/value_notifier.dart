import 'package:flutter/material.dart';

// Explicit Animation의 모든 출발은 AnimationController에서 시작된다.
class ValueNotifierAnimation extends StatefulWidget {
  const ValueNotifierAnimation({super.key});

  @override
  State<ValueNotifierAnimation> createState() => _ValueNotifierAnimationState();
}

class _ValueNotifierAnimationState extends State<ValueNotifierAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 1),
  )..addListener(() {
      setState(() {
        _range.value = _controller.value;
      });
    });

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
    reverseCurve: Curves.bounceIn,
  );

  late final Animation<Decoration> _decoration = DecorationTween(
    begin: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    end: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(120),
    ),
  ).animate(_curve);

  late final Animation<double> _rotation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_curve);

  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 1.1,
  ).animate(_curve);

  late final Animation<Offset> _offset = Tween(
    begin: Offset.zero,
    end: const Offset(0, -0.2),
  ).animate(_curve);

  void _play() => _controller.forward();
  void _pause() => _controller.stop();
  void _rewind() => _controller.reverse();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final ValueNotifier<double> _range = ValueNotifier(0.0);

  void _onChanged(double value) {
    _range.value = 0;
    _controller.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animation Value",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _offset,
                child: ScaleTransition(
                  scale: _scale,
                  child: RotationTransition(
                    turns: _rotation,
                    child: DecoratedBoxTransition(
                      decoration: _decoration,
                      child: const SizedBox(
                        width: 400,
                        height: 400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder(
                valueListenable: _range,
                builder: (context, value, child) {
                  return Slider(
                    value: _range.value,
                    onChanged: _onChanged,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
