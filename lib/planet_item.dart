import 'package:flutter/material.dart';
import 'package:planetrian/planet_data.dart';
import 'dart:math' as math;

class PlanetItem extends StatefulWidget {
  final int index;

  PlanetItem({this.index});

  @override
  _PlanetItemState createState() => _PlanetItemState();
}

class _PlanetItemState extends State<PlanetItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30000,
      ),
    );
    _controller.forward();
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image' + widget.index.toString(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) {
          return Transform.rotate(
            angle: math.pi * _controller.value * 2,
            child: child,
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
              child: Image.asset(
            PlanetData.planets[widget.index].image,
          )),
        ),
      ),
    );
  }
}
