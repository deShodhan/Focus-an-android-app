import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/config/images.dart';
import 'package:stayfocused/config/sizeConfig.dart';
import 'package:stayfocused/pages/about.dart';
import 'package:stayfocused/pages/forest.dart';
import 'package:stayfocused/pages/nursery.dart';
import 'package:stayfocused/pages/share.dart';
import 'package:stayfocused/pages/suggetions.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(context),
        bottomNavigationBar: _bottomNavigationBar(context),
        body: ListView(
          children: [
            _plantnow(context),
            _quotes(context),
          ],
        ),
        /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SizedBox(
          height: 15.0.h,
          width: 15.0.w,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Center(
              child: Container(
                height: 15.0.w,
                width: 15.0.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('${Images.chat}'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myForest()),
                //You(index: index)
              );
            },
          ),
        ),*/
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.card_giftcard,
          size: 10.0.w,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => shareApp()),
            //You(index: index)
          );
        },
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "stayFocused",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 20.0.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _quotes(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: RichText(
        textScaleFactor: 1,
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 17.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: '“The successful warrior is the average man, with laser-like focus.”',
                style:
                new TextStyle(fontWeight: FontWeight.normal)),
            new TextSpan(
                text: ' \n-Bruce Lee \n\n',
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(
                text: '“Whenever you want to achieve something, keep your eyes open, '
                    'concentrate and make sure you know exactly what it is you want. No one can hit their target with their eyes closed.”',
                style:
                new TextStyle(fontWeight: FontWeight.normal)),
            new TextSpan(
                text: ' \n-Paulo Coelho \n\n',
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(
                text: '“Concentrate all your thoughts upon the work at hand. The sun’s rays do not burn until brought to a focus.”',
                style:
                new TextStyle(fontWeight: FontWeight.normal)),
            new TextSpan(
                text: ' \n-Alexander Graham Bell \n\n',
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(
                text: '“Lack of direction, not lack of time, is the problem. We all have twenty-four hour days.”',
                style:
                new TextStyle(fontWeight: FontWeight.normal)),
            new TextSpan(
                text: ' \n-Zig Ziglar \n\n',
                style: new TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _plantnow(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Align(
          child: Container(
            height: 45.0.h,
            width: 90.0.w,
            child: Column(
              children: [
                Container(
                  height: 45.0.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('${Images.forest_pic_home}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Center(
                        child: Container(
                          height: 55.0.w,
                          width: 55.0.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[200], width: 1.0),
                            image: DecorationImage(
                              image: AssetImage('${Images.tree_in_home}'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.9),
                                  BlendMode.dstATop),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0.w),
                        child: Container(
                          height: 5.0.h,
                          child: Text(
                            "Start planting now!",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 17.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nursery()),
          //You(index: index)
        );
      },
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 10.0.h,
        width: 100.0.w,
        child: Row(
          children: [
            SizedBox(
              height: 10.0.h,
              width: 5.0.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: Container(
                  height: 15.0.w,
                  width: 15.0.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1.0),
                    image: DecorationImage(
                      image: AssetImage('${Images.home}'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 7.5.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.myForest}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => myForest()),
                      //You(index: index)
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 7.5.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.info}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => about()),
                      //You(index: index)
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 5.0.w,
            ),
          ],
        ),
      ),
    );
  }
}
