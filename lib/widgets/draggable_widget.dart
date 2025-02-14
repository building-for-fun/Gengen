import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Widget child;

  DraggableWidget({required this.child});

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double x = 50, y = 50;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            x += details.delta.dx;
            y += details.delta.dy;
          });
        },
        child: widget.child,
      ),
    );
  }
}
