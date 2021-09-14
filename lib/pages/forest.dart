import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:stayfocused/config/images.dart';
import 'package:stayfocused/database/taskmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/home_page/home.dart';
import 'package:stayfocused/pages/about.dart';

class myForest extends StatefulWidget {
  @override
  _myForestState createState() => _myForestState();
}

class _myForestState extends State<myForest> {
  ToDoHelper _doHelper = ToDoHelper();
  TaskModel3 mytask;
  List<TaskModel3> tasks = [];
  bool yes = false;
  int count = null;
  AudioCache cache = AudioCache();
  AudioPlayer player;
  int x = 0;

  @override
  void initState() {
    // TODO: implement initState
    //_playFile();
    super.initState();
    getH();
  }

  /*void _playFile() async{
    player = await cache.play('audiofiles/birdssound.wav'); // assign player here
  }

  void _stopFile() {
    debugPrint("done__________");
    cache.clearCache();
    player?.stop(); // stop the file like this
  }*/

  getH() async {
    debugPrint("initPrint called");
    List<TaskModel3> list = [];
    list = await _doHelper.getAllTaskPQ().whenComplete(() {
      yes = true;
    });

    setState(() {
      if (list.isNotEmpty) {
        tasks = new List.from(list.reversed);
      }
    });
  }

  @override
  void dispose() {
    //_stopFile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!yes) {
      return Center(
        child: Container(
          color: Colors.white,
          width: 100.0.w,
          height: 100.0.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15.0.w),
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: onBackPressed,
        child: Scaffold(
          appBar: _appBar(context),
          body: Container(
              height: 100.0.h,
              width: 100.0.w,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(Images.bg_forest),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    height: 75.0.h,
                    width: 100.0.w,
                    child: ListView.separated(
                      //reverse: true,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            height: 10.0.h,
                            width: 90.0.w,
                            color: Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Container(
                                    height: 20.0.w,
                                    width: 20.0.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: DecorationImage(
                                        //image: AssetImage('assets/images/plant1.jpg'),
                                        //image: AssetImage('assets/images/${tasks[index].quote}.jpg'),
                                        image: AssetImage(
                                            '${checkPAth(tasks[index].quote)}'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.7),
                                            BlendMode.dstATop),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10.0.h,
                                    width: 70.0.w,
                                    color: Colors.transparent,
                                    child: ListTile(
                                      /*leading: Text("${tasks[index].duration}",
                                style: TextStyle(
                                  fontSize: 15.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),),*/
                                      title: Text(
                                        "${tasks[index].namemain}",
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                showD(
                                    context,
                                    tasks[index].duration,
                                    tasks[index].quote,
                                    tasks[index].duration,
                                    tasks[index].namemain);
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: tasks.length,
                    ),
                  )
                ],
              )),
          bottomNavigationBar: _bottomNavigationBar(context),
        ),
      );
    }
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "Forest",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 20.0.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
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
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.home}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
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
                      border: Border.all(color: Colors.black, width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.myForest}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: () {},
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => about()),
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

  String checkPAth(String _pname) {
    if (_pname == 'plant1.jpg') {
      return 'assets/images/plant1.jpg';
    } else if (_pname == 'plant2.jpg') {
      return 'assets/images/plant2.jpg';
    } else if (_pname == 'plant3.jpg') {
      return 'assets/images/plant3.jpg';
    } else if (_pname == 'plant4.jpg') {
      return 'assets/images/plant4.jpg';
    } else if (_pname == 'plant5.jpg') {
      return 'assets/images/plant5.jpg';
    } else if (_pname == 'plant6.jpg') {
      return 'assets/images/plant6.jpg';
    } else if (_pname == 'plant7.jpg') {
      return 'assets/images/plant7.jpg';
    } else if (_pname == 'plant8.jpg') {
      return 'assets/images/plant8.jpg';
    } else if (_pname == 'plant9.jpg') {
      return 'assets/images/plant9.jpg';
    }
  }

  void showD(BuildContext context, int time, String _plantname, int _timeInSec,
      String _plantnameMain) {
    Dialog dialog = Dialog(
      child: Container(
        color: Colors.grey[200],
        height: 60.0.h,
        width: 90.0.w,
        child: Column(
          children: [
            SizedBox(
              height: 5.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: RichText(
                  text: TextSpan(
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: 'Name:',
                          style: new TextStyle(
                            fontWeight: FontWeight.normal,
                          )),
                      new TextSpan(
                          text: ' $_plantnameMain Tree',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: RichText(
                  text: TextSpan(
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: 'Duration:',
                          style: new TextStyle(
                            fontWeight: FontWeight.normal,
                          )),
                      new TextSpan(
                          text: '${_printDuration(Duration(seconds: time))}',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60.0.w,
                width: 60.0.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('${checkPAth(_plantname)}'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            SizedBox(
              height: 7.0.h,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Plant now!",
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<bool> onBackPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }
}
