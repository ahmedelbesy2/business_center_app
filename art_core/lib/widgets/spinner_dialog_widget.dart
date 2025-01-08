import 'package:flutter/material.dart';
import 'dart:math' as math;

class spinnerDialogWidget extends StatefulWidget {
  @override
  _spinnerDialogState createState() => new _spinnerDialogState();
}
class _spinnerDialogState extends State<spinnerDialogWidget> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;

@override
dispose() {
  _controller.dispose(); // you need this
  super.dispose();
}
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return 
       Center(
        
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: CircularProgressIndicator(color: Colors.lightGreenAccent)
        ),
      ) ;
  }
}