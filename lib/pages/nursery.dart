import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/pages/timer.dart';

class Nursery extends StatefulWidget {
  @override
  _NurseryState createState() => _NurseryState();
}

class _NurseryState extends State<Nursery> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: _appBar(context),
        body: ListView(
          children: [
            _plants(context),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "Nursery",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 20.0.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _plants(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 80.0.h,
        width: 90.0.w,
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 5M",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: () {
                    showD(context, '5s', 'plant1.jpg',5, 'Pine');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant2.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 10M",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '10s', 'plant2.jpg',10, 'Maple');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant3.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 15M",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '15M', 'plant3.jpg',7, 'Giant Sequoias');
                  },
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant4.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 30M",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '30M', 'plant4.jpg',6, 'Mango');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant5.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 45M",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '45M', 'plant5.jpg',13, 'Dragons blood');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant6.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 1hr",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '1Hr', 'plant6.jpg',12, 'Oak');
                  },
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant7.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 2hr",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '2Hr', 'plant7.jpg',16, 'Neem');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant8.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 3hr",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '3Hr', 'plant8.jpg',11, 'Coconut');
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20.0.w,
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/plant9.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            "dur: 4hr",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  onTap: (){
                    showD(context, '4Hr', 'plant9.jpg',14, 'Banyan');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showD(BuildContext context, String time, String _plantname, int _timeInSec, String _plantnameMain) {
    Dialog dialog = Dialog(
      child: Container(
        color: Colors.grey[200],
        height: 60.0.h,
        width: 90.0.w,
        child: Column(
          children: [
            SizedBox(height: 5.0.h),
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
                          text: ' $_plantnameMain ',
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
                          text: 'Growth duration:',
                          style: new TextStyle(
                            fontWeight: FontWeight.normal,
                          )),
                      new TextSpan(
                          text: ' $time ',
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white,
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
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => timerPage(duration: _timeInSec, plantname: _plantname, plantnameMain: _plantnameMain,)),
                  //You(index: index)
                );
              },
              child: Text(
                "Plant now!",
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  String checkPAth(String _pname){
    if(_pname=='plant1.jpg'){
      return 'assets/images/plant1.jpg';
    }else if(_pname=='plant2.jpg'){
      return 'assets/images/plant2.jpg';
    }else if(_pname=='plant3.jpg'){
      return 'assets/images/plant3.jpg';
    }else if(_pname=='plant4.jpg'){
      return 'assets/images/plant4.jpg';
    }else if(_pname=='plant5.jpg'){
      return 'assets/images/plant5.jpg';
    }else if(_pname=='plant6.jpg'){
      return 'assets/images/plant6.jpg';
    }else if(_pname=='plant7.jpg'){
      return 'assets/images/plant7.jpg';
    }else if(_pname=='plant8.jpg'){
      return 'assets/images/plant8.jpg';
    }else if(_pname=='plant9.jpg'){
      return 'assets/images/plant9.jpg';
    }
  }
}
