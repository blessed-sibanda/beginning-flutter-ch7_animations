import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  final double _height = 100.0;
  double _width = 100.0;

  _increaseWidth(double maxWidth) {
    setState(() {
      // allow 10 for springing allowance so that it doesn't overflow
      if ((_width + 50 + 10) >= maxWidth) {
        _width = 100;
      } else {
        _width += 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          color: Colors.amber,
          height: _height,
          width: _width,
          child: MaterialButton(
            child: Text('Tap to\nGrow Width\n$_width'),
            onPressed: () => _increaseWidth(maxWidth),
          ),
        ),
      ],
    );
  }
}
