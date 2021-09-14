import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer_util.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:stayfocused/pages/suggetions.dart';
import 'package:sizer/sizer.dart';


import 'config/images.dart';
import 'home_page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(                           //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(                  //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            //SizeConf().int(context);
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Loading..",
              home: Splash2(),
            );
          },
        );
      },
    );
  }
}

/*--------------------splash screen------------------------------------------------*/

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
      backgroundColor: Color(0xffffBD59),
      body: Column(
        children: [
          Container(color:Color(0xffffBD59),height: 30.0.h,),
          Container(
            height: 70.0.h,
            width: 100.0.w,
            color:Color(0xffffBD59),
            child: Center(
              child: SplashScreen(
                backgroundColor: Color(0xffffBD59),
                seconds: 5,
                navigateAfterSeconds: new userCheck(),
                //title: new Text('GeeksForGeeks',textScaleFactor: 2,),
                image: new Image.asset(Images.splash),
                //loadingText: Text("Loading"),
                photoSize: 25.0.w,
                useLoader: false,
                //loaderColor: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

/*----------------------check if new user------------------------------------------*/

class userCheck extends StatefulWidget {
  @override
  _userCheckState createState() => _userCheckState();
}

class _userCheckState extends State<userCheck> {

  var theData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSuggetions().whenComplete(() {
      setState(() {
        if(theData==null){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => suggetions()),
            //You(index: index)
          );
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage()),
            //You(index: index)
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.0.w,
        height: 100.0.h,
        child: Center(
          child: Text(
            "Loading..",
            textScaleFactor: 1,
            style: TextStyle(
              fontSize: 15.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkSuggetions() async {
    final sharedPreferences= await SharedPreferences.getInstance();
    theData =sharedPreferences.getInt('checked');
    debugPrint("data is------------------------------------------------------------"+theData.toString());
  }
}
