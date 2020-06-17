import 'package:flutter/material.dart';
import 'package:planetrian/description_screen.dart';
import 'package:planetrian/planet_data.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  final int index;
  final double bgPosition;

  DetailScreen({this.index, this.bgPosition});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controllerPosition;

  void start() async {
    await Future.delayed(Duration(milliseconds: 450));

    _controllerPosition.forward();
    _controller.forward();
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerPosition.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerPosition = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 450,
      ),
    );
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30000,
      ),
    );

    start();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double planetPosition() {
      return (_controllerPosition.value * size.height * 0.5);
    }

    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              right: widget.bgPosition,
              child: Hero(
                tag: 'bg' + widget.index.toString(),
                child: Container(
                  height: size.height * 1.5,
                  child: Image.asset(
                    'assets/bg.png',
                    alignment: Alignment.center,
                    height: size.height * 1.5,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                return Transform.translate(
                  offset: Offset(0, planetPosition()),
                  child: Transform.rotate(
                    angle: math.pi * _controller.value * 2,
                    child: Hero(
                      tag: 'image' + widget.index.toString(),
                      child: Image.asset(
                        PlanetData.planets[widget.index].image,
                        width: size.width,
                        height: size.width,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: DescriptionScreen(
                index: widget.index,
              ),
            )
          ],
        ),
      ),
    );
  }
}
