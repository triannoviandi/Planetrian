import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetrian/fade_in.dart';
import 'package:planetrian/planet_data.dart';

class DescriptionScreen extends StatelessWidget {
  final int index;
  DescriptionScreen({this.index});
  @override
  Widget build(BuildContext context) {
    PlanetData planetData = PlanetData.planets[index];
    Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(ScreenUtil().setWidth(62)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FadeIn(
            left: true,
            delay: 5.5,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: size.width / 8,
                width: size.width / 8,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: size.width / 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setSp(50),
          ),
          FadeIn(
            left: true,
            delay: 2.0,
            child: Text(
              planetData.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(108),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setSp(50),
          ),
          FadeIn(
            left: true,
            delay: 2.5,
            child: Text(
              planetData.data,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setSp(50),
          ),
          FadeIn(
            left: true,
            delay: 3.0,
            child: Row(
              children: <Widget>[
                Text(
                  'Mass : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  planetData.mass,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          FadeIn(
            left: true,
            delay: 3.0,
            child: Row(
              children: <Widget>[
                Text(
                  'Radius : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  planetData.radius,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          FadeIn(
            left: true,
            delay: 3.0,
            child: Row(
              children: <Widget>[
                Text(
                  'Orbital Period : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  planetData.orbitalPeriod,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
