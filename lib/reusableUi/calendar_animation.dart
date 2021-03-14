import 'package:flutter/material.dart';
import 'package:ginFinans/util/palette.dart';

class CalendarAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarAnimation();
}

class _CalendarAnimation extends State<CalendarAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            child: ScaleTransition(
              scale: _tween.animate(CurvedAnimation(
                  parent: _controller, curve: Curves.elasticOut)),
              child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Container(
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.calendar_today,
                          color: Palette.skyBlue, size: 10))),
            ),
          ),
        ],
      ),
    );
  }
}
