import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                color: Colors.amber,
                height: 100.0,
                width: 100.0,
              ),
              secondChild: Container(
                color: Colors.lime,
                height: 200.0,
                width: 200.0,
              ),
              crossFadeState: _crossFadeStateShowFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500),
              sizeCurve: Curves.bounceOut,
            ),
            Positioned.fill(
              child: TextButton(
                onPressed: _crossFade,
                child: const Text(
                  'Tap to\nFade Color & Size',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
