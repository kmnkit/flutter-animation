import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({super.key});

  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState extends State<TweenAnimationBuilderScreen> {
  bool _visible = true;
  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: Colors.purple,
                end: Colors.red,
              ),
              // Tween(
              //   begin: 10.0,
              //   end: 20.0,
              // ), // Animation의 타겟 값. 어디서 어디까지 애니메이션 효과를 추가하고 싶은지 정하는 값.
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png",
                  color: value,
                  colorBlendMode: BlendMode.hardLight, // 색상이 이미지와 어떻게 혼합될지를 설정한다.
                );
              },
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
