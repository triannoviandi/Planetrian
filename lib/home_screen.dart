import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetrian/detail_screen.dart';
import 'package:planetrian/planet_data.dart';
import 'package:planetrian/planet_item.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int planetIndex = 2;
  ScrollController _scrollController = ScrollController();

  double bgPosition() {
    if (_scrollController != null && _scrollController.hasClients) {
      return _scrollController.offset * -1 / 4;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    PlanetData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AnimatedBuilder(
              animation: _scrollController,
              builder: (ctx, widget) {
                return Positioned(
                  right: bgPosition(),
                  child: Hero(
                    tag: 'bg' + planetIndex.toString(),
                    child: Image.asset(
                      'assets/bg.png',
                      alignment: Alignment.centerLeft,
                      height: size.height,
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(),
                  planets(context),
                  description(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget planets(BuildContext context) {
    return Expanded(
      flex: 3,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: ScrollSnapList(
          padding: EdgeInsets.all(0),
          itemSize: MediaQuery.of(context).size.width * 0.4,
          margin: EdgeInsets.all(0),
          onItemFocus: (index) {
            setState(() {
              planetIndex = index;
            });
          },
          dynamicItemSize: true,
          curve: Curves.ease,
          initialIndex: 2,
          scrollDirection: Axis.horizontal,
          listController: _scrollController,
          itemCount: 8,
          itemBuilder: (ctx, index) {
            return PlanetItem(
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget header() {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Planetrian',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(66),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(24),
            ),
            Text(
              'Hi reviewer, Hope you enjoy the app',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(44),
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget description() {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              PlanetData.planets[planetIndex].name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(88),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(50),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    index: planetIndex,
                    bgPosition: bgPosition(),
                  );
                }));
              },
              child: Container(
                height: size.width / 5,
                width: size.width / 5,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(70)),
                child: Center(
                  child: Icon(
                    CupertinoIcons.up_arrow,
                    color: Colors.white,
                    size: size.width / 9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
